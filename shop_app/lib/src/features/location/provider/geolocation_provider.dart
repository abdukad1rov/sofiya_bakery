import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop_app/src/core/tools/file_importers.dart';

class GeoLocationProvider extends ChangeNotifier {
  Position? currentPosition;
  String? currentAddress;
  bool isMapCreated = false;
  late GoogleMapController mapController;
  bool isLoading = false;
  LatLng? selectedLocation;

  String? locationName;
  String? homeNumber;
  String? flatNumber;
  String? intercomCode;
  String? addPhoneNumber;

  void setLocationName(String? value) {
    locationName = value;
    notifyListeners();
  }

  bool save(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.getDistancePrice(context);

    if (locationName == null || locationName!.isEmpty) {
      showSnackBar(context, 'Please enter your location name');
      return false;
    } else {
      Navigator.pop(context);
      Navigator.pop(context);
      return true;
    }
  }

  void clear() {
    locationName = null;
    homeNumber = null;
    flatNumber = null;
    intercomCode = null;
    addPhoneNumber = null;
    currentAddress = null;
    notifyListeners();
  }

  Future<void> getCurrentPosition() async {
    try {
      isLoading = true;
      notifyListeners();

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      currentPosition = position;
      selectedLocation = LatLng(position.latitude, position.longitude);
      await getAddress(selectedLocation!);

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      fatal(e);
    }
  }

  Future<void> getAddress(LatLng position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        currentAddress =
            '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
      } else {
        currentAddress = 'Address not found';
      }
    } catch (e) {
      fatal(e);
      currentAddress = 'Address not available';
    }
    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    isMapCreated = true;
    notifyListeners();
  }

  void onCameraMove(CameraPosition position) {
    selectedLocation = position.target;
  }

  void onCameraIdle() {
    if (selectedLocation != null) {
      getAddress(selectedLocation!);
    }
  }

  Future<void> animateToCurrentLocation() async {
    if (currentPosition == null) {
      await getCurrentPosition();
    }

    if (currentPosition != null) {
      final currentLatLng =
          LatLng(currentPosition!.latitude, currentPosition!.longitude);
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentLatLng, zoom: 15.0),
        ),
      );
      selectedLocation = currentLatLng;
      await getAddress(currentLatLng);
    } else {
      print('Current position is null');
    }
  }

  void showSnackBar(BuildContext context, String message, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? AppColors.red,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        margin: const EdgeInsets.all(16.0),
        elevation: 6.0,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
