import 'package:shop_app/src/core/tools/file_importers.dart';

class OrderService {
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: Config.baseUrl,
      contentType: Headers.jsonContentType,
      followRedirects: true,
      maxRedirects: 5,
    );

  static Future<int?> createOrder(
    OrderModel order,
    List<Map<String, int>> productList,
  ) async {
    try {
      final response = await _dio.post(
        '/add-order/',
        data: order.toJson(productList),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        info('Order created successfully');
        // print(response.data['order_id']);
        return response.data['order_id'];
      } else {
        warning('Failed to create order. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      fatal('Error in createOrder: $e');
      return null;
    }
  }

  static Future<OrderModel?> getOrderById(int orderId) async {
    try {
      final response = await _dio.get('/order/$orderId');
      if (response.statusCode == 200) {
        return OrderModel.fromJson(response.data);
      } else if (response.statusCode == 404) {
        info('Order with ID $orderId not found');
        return null;
      } else {
        warning('Failed to fetch order. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      fatal('Error in getOrderById: $e');
      return null;
    }
  }

  static Future<void> addOrderUser(int userId, int orderID) async {
    try {
      final response = await _dio.post('/add-order-user/$orderID/$userId');

      if (response.statusCode == 200 || response.statusCode == 201) {
        info('Order added to user successfully');
      } else {
        warning(
            'Failed to add order to user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      fatal('Error in addOrderUser: $e');
    }
  }
}
