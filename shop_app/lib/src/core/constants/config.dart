import 'package:shop_app/src/core/tools/file_importers.dart';

final class Config {
  const Config._();


  static const String baseUrl =
      'https://13b1-2a03-32c0-2d-c8e-319e-427a-f3c0-bc75.ngrok-free.app';

  static const String media = '$baseUrl/media/';

  static const String googleApiUrl = 'https://maps.googleapis.com';

  static const String googleApiKey = 'AIzaSyDqiZx9bv1VK85IzCLSeXy9FvCjZeB-_bc';

  static const originLocation = LatLng(42.30020238827357, 69.76079934783557);
}
