import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/src/core/tools/file_importers.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  Future<bool> requestLocationPermission(BuildContext context) async {
    final status = await Permission.location.status;

    if (status.isGranted) {
      return true;
    }

    if (status.isDenied) {
      final result = await Permission.location.request();
      if (result.isGranted) return true;
    }

    if (status.isPermanentlyDenied && context.mounted) {
      // Показываем диалог с предложением открыть настройки
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Разрешение на геолокацию'),
          content: const Text(
              'Приложению необходимо разрешение на доступ к местоположению. Пожалуйста, откройте настройки и предоставьте разрешение.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
              child: const Text('Открыть настройки'),
            ),
          ],
        ),
      );
    }

    return false;
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 20.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_animationController.isAnimating) {
      _animationController.repeat(reverse: true);
    }
  }

  void _stopAnimation() {
    if (_animationController.isAnimating) {
      _animationController.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final geoLocationService = Provider.of<GeoLocationProvider>(context);

    requestLocationPermission(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.location,
          style: Styles.poppins500.copyWith(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: geoLocationService.onMapCreated,
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: Config.originLocation,
              zoom: 14.0,
            ),
            onCameraMove: (position) {
              _startAnimation();
              geoLocationService.onCameraMove(position);
            },
            onCameraIdle: () {
              _stopAnimation();
              geoLocationService.onCameraIdle();
            },
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
          ),
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: child,
                );
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 50.h),
                child: Image.asset(
                  AppIcons.marker,
                  width: 60.w,
                  height: 60.h,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Card(
              color: AppColors.white,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  geoLocationService.currentAddress ?? context.l10n.loading,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    backgroundColor: AppColors.mainColor,
                    onPressed: geoLocationService.animateToCurrentLocation,
                    child: Icon(
                      Icons.my_location,
                      size: 25.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomButton(
                    text: context.l10n.save,
                    onPressed: () {
                      geoLocationService.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectLocationScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
