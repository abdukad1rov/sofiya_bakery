import 'package:shop_app/src/core/tools/file_importers.dart';

class LocationService {
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: Config.googleApiUrl,
      contentType: Headers.jsonContentType,
    );

  static Future<int?> getDistance({required LatLng? destination}) async {
    try {
      final response =
          await _dio.get('/maps/api/directions/json', queryParameters: {
        'origin':
            '${Config.originLocation.latitude},${Config.originLocation.longitude}',
        'destination': '${destination?.latitude},${destination?.longitude}',
        'key': Config.googleApiKey,
        'mode': 'driving',
      });

      if (response.statusCode == 200) {
        final data = response.data;
        print("Response Data: $data");

        if (data['status'] == 'OK') {
          final distanceValue =
              data['routes'][0]['legs'][0]['distance']['value'];
          if (distanceValue is int) {
            return distanceValue; // Masofani metrda qaytaradi
          } else {
            print('Distance value is not an integer');
            return null;
          }
        } else {
          print(
              'Error: ${data['status']} - ${data['error_message'] ?? 'No error message'}');
          return null;
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }
}
