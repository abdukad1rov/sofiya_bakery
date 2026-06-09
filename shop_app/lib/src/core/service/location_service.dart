
// import 'package:shop_app/src/core/tools/file_importers.dart';

// class GeoLocationService {
//   String? currentAddress;
//   Position? currentPosition;

//   static final Dio _dio = Dio()
//     ..options = BaseOptions(
//       baseUrl: Config.googleApiUrl,
//       contentType: Headers.jsonContentType,
//     );

//   static Future<String?> getDirections({required LatLng destination}) async {
//     try {
//       final response =
//           await _dio.get('/maps/api/directions/json/', queryParameters: {
//         'origin':
//             '${Config.originLocation.latitude},${Config.originLocation.longitude}',
//         'destination': '${destination.latitude},${destination.longitude}',
//         'key': Config.googleApiKey,
//       });

//       if (response.statusCode == 200) {
//         final data = json.decode(response.data);

//         if (data['status'] == 'OK') {
//           return data['routes'][0]['legs'][0]['distance'];
//         } else {
//           info(
//               'Route not found. Status: ${data['status']}, Reason: ${data['error_message']}');
//           return null;
//         }
//       } else {
//         warning('Request failed. Status code: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       fatal('An error occurred: $e');
//       return null;
//     }
//   }

//   Future<bool> handleLocationPermission() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();

//     if (!serviceEnabled) {
//       debugPrint('Location services are disabled. Please enable the services');
//       return false;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         debugPrint('Location permissions are denied');
//         return false;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       debugPrint(
//           'Location permissions are permanently denied, we cannot request permissions.');
//       return false;
//     }
//     return true;
//   }

//   Future<void> getCurrentPosition() async {
//     final hasPermission = await handleLocationPermission();

//     if (!hasPermission) return;
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       currentPosition = position;
//       getAddressFromLatLng(currentPosition!);
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }

//   Future<String?> getAddressFromLatLng(Position? position) async {
//     try {
//       List<Placemark> placeMarks = await placemarkFromCoordinates(
//           currentPosition!.latitude, currentPosition!.longitude);
//       Placemark place = placeMarks[0];

//       currentAddress =
//           '${place.subLocality} ${place.locality} ${place.country}';

//       return currentAddress;
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<String?> currentLocation() async {
//     await getCurrentPosition();
//     if (currentPosition == null) return null;
//     final currentLocation = await getAddressFromLatLng(currentPosition!);
//     return currentLocation;
//   }

//   Future<String?> getDistanceBetweenTwoPoints(
//       {required Position origin, required Position destination}) async {
//     double distanceInMeters = Geolocator.distanceBetween(origin.latitude,
//         origin.longitude, destination.latitude, destination.longitude);
//     return (distanceInMeters / 1000).toStringAsFixed(2);
//   }

//   Future<String?> getDurationBetweenTwoPoints(
//       {required Position origin, required Position destination}) async {
//     double distanceInMeters = Geolocator.distanceBetween(origin.latitude,
//         origin.longitude, destination.latitude, destination.longitude);
//     double durationInMinutes = distanceInMeters / 500;
//     return durationInMinutes.toStringAsFixed(0);
//   }

//   Future<void> getAddress(LatLng position) async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//         position.latitude,
//         position.longitude,
//       );
//       Placemark place = placemarks[0];

//       currentAddress =
//           '${place.street}, ${place.locality}, ${place.administrativeArea}';
//     } catch (e) {
//       fatal(e);
//     }
//   }
// }
