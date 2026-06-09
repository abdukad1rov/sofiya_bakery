import 'package:shop_app/src/core/tools/file_importers.dart';
import 'package:shop_app/src/features/location/service/location_service.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> cart = [];

  int deliveredPrice = 1000;

  String description = '';

  bool isPayCash = true;

  String? comment;

  void changePayCash(bool value) {
    isPayCash = value;
    notifyListeners();
  }

  void addProduct(ProductModel product, BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    int productIndex =
        homeProvider.products.indexWhere((item) => item.id == product.id);

    if (productIndex != -1) {
      if (cart.any((item) => item.id == product.id)) {
        int cartIndex = cart.indexWhere((item) => item.id == product.id);
        cart[cartIndex] =
            cart[cartIndex].copyWith(count: cart[cartIndex].count + 1);
        homeProvider.products[productIndex] = homeProvider
            .products[productIndex]
            .copyWith(count: homeProvider.products[productIndex].count + 1);
      } else {
        cart.add(product.copyWith(count: 1));
        homeProvider.products[productIndex] =
            homeProvider.products[productIndex].copyWith(count: 1);
      }

      int categoryProductIndex = homeProvider.categoryProduct
          .indexWhere((item) => item.id == product.id);
      if (categoryProductIndex != -1) {
        homeProvider.categoryProduct[categoryProductIndex] =
            homeProvider.categoryProduct[categoryProductIndex].copyWith(
          count: homeProvider.categoryProduct[categoryProductIndex].count + 1,
        );
      }

      notifyListeners();
    }
  }

  void removeProduct(ProductModel product, BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    int productIndex =
        homeProvider.products.indexWhere((item) => item.id == product.id);

    if (productIndex != -1 && cart.any((item) => item.id == product.id)) {
      int index = cart.indexWhere((item) => item.id == product.id);

      if (cart[index].count == 1) {
        cart.removeAt(index);
        homeProvider.products[productIndex] =
            homeProvider.products[productIndex].copyWith(count: 0);
      } else {
        cart[index] = cart[index].copyWith(count: cart[index].count - 1);
        homeProvider.products[productIndex] = homeProvider
            .products[productIndex]
            .copyWith(count: homeProvider.products[productIndex].count - 1);
      }

      int categoryProductIndex = homeProvider.categoryProduct
          .indexWhere((item) => item.id == product.id);
      if (categoryProductIndex != -1) {
        homeProvider.categoryProduct[categoryProductIndex] =
            homeProvider.categoryProduct[categoryProductIndex].copyWith(
          count: homeProvider.categoryProduct[categoryProductIndex].count - 1,
        );
      }

      notifyListeners();
    }
  }

  String calculatePrice(ProductModel product, BuildContext context) {
    int index = cart.indexWhere((item) => item.id == product.id);

    String price =
        "${double.parse(product.price).toInt() * cart[index].count} ₸";

    return price;
  }

  int getAllProductPrice() {
    int sum = 0;

    for (final i in cart) {
      sum += double.parse(i.price).toInt() * i.count;
    }

    return sum;
  }

  void getDistancePrice(BuildContext context) async {
    final locationProvider =
        Provider.of<GeoLocationProvider>(context, listen: false);
    final km = await LocationService.getDistance(
            destination: locationProvider.selectedLocation!) ??
        0;
    info('Distance: $km');
    deliveredPrice = km ~/ 2;

    notifyListeners();
  }

  void deleteAllProducts(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    homeProvider.initialize();

    cart.clear();
    notifyListeners();
  }

  void createOrder(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final locationProvider =
        Provider.of<GeoLocationProvider>(context, listen: false);

    if (locationProvider.selectedLocation == null) {
      showSnackBar(context, context.l10n.pleaseSelectLocation);
      return;
    }

    homeProvider.count0Product();

    notifyListeners();

    List<Map<String, int>> productsList = [];

    for (final i in cart) {
      productsList.add({'productId': i.id, 'count': i.count});
    }

    description = """
Коментарий: ${comment?.trim() ?? 'Отсутствует'}
Название местоположения: ${locationProvider.locationName}
Номер Домa: ${locationProvider.homeNumber}
Номер квартиры: ${locationProvider.flatNumber} 
Домофон: ${locationProvider.intercomCode}
Доп тел номер: ${locationProvider.addPhoneNumber}
Опоата наличными: ${isPayCash ? 'Да' : 'Нет'}
Оплата Kaspi: ${isPayCash ? 'net' : 'da'}
    """;

    final orderModel = OrderModel(
      id: -1,
      userId: authProvider.user!.id,
      description: description,
      locationLink:
          'https://www.google.com/maps/search/?api=1&query=${locationProvider.selectedLocation?.latitude},${locationProvider.selectedLocation?.longitude}',
      totalPrice: getAllProductPrice().toString(),
      createdAt: DateTime.now(),
      isAccepted: false,
      isProcess: false,
      isDelivered: false,
      isCompleted: false,
      isCanceled: false,
      productsList: [],
    );
    if (context.mounted) {
      Navigator.pop(context);
      showDialog(context: context, builder: (context) => const SuccessDialog());
    }
    cart.clear();
    notifyListeners();

    int? id = await OrderService.createOrder(orderModel, productsList);

    if (id != null) {
      await OrderService.addOrderUser(authProvider.user!.id, id);
      authProvider.getUserWithId(DBService.userId);
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
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
