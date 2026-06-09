import 'package:shop_app/src/core/tools/file_importers.dart';

class AuthService {
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: Config.baseUrl,
      contentType: 'application/json',
      followRedirects: true,
      maxRedirects: 5,
    );

  static Future<UserModel?> getUser(String userId) async {
    try {
      final response = await _dio.get('/get-user/$userId/');
      if (response.statusCode == 200) {
        info('User loaded successfully');

        final UserModel user = UserModel.fromJson(response.data);
        print(user);
        return user;
      } else {
        warning('Failed to load user. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      fatal('Error in getUserWithPhoneNumber: $e');
      return null;
    }
  }

  static Future<void> sendSMS(String phoneNumber, String smsCode) async {
    try {
      Response response = await _dio.post('/send-sms/', data: {'sms': smsCode});

      if (response.statusCode == 200) {
        info('SMS sent successfully');
      } else {
        warning('Failed to send SMS. Status code: ${response.statusCode}');
      }
    } catch (e) {
      fatal('Error sending SMS: $e');
    }
  }

  static Future<String?> getUserWithPhoneNumber(String phoneNumber) async {
    try {
      final response =
          await _dio.post('/get-user-phone-number/+7$phoneNumber/');

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        int id = responseData['user_id'];
        return '$id';
      } else if (response.statusCode == 404) {
        warning('Uer Not Found');
        return null;
      } else {
        fatal('Failed to fetch user. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      fatal('Error fetching user: $e');
      return null;
    }
  }

  static Future<void> updateUserFavoriteProducts(UserModel user) async {
    try {
      Response response = await _dio
          .post('/update-favorite-products/${user.id}/', data: user.toJson());

      if (response.statusCode == 200) {
        info('User updated successfully $user');
        print(response.data);
      } else {
        warning('Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      fatal('Error updating user: $e');
    }
  }

  static Future<String> postUser(UserModel user) async {
    try {
      Response response = await _dio.post('/add-user/', data: user.toJson());

      if (response.statusCode == 200) {
        info('User added successfully');
        return response.data['user_id'].toString();
      } else {
        warning('Failed to add user. Status code: ${response.statusCode}');
        return '';
      }
    } catch (e) {
      fatal('Error adding user: $e');
      return '';
    }
  }

  static Future<void> addOrderUser(int userId, int orderId) async {
    try {
      Response response = await _dio.post('/add-order-user/$userId/$orderId/');

      if (response.statusCode == 200) {
        info('Order added to user successfully');
      } else {
        warning(
            'Failed to add order to user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      fatal('Error adding order to user: $e');
    }
  }
}
