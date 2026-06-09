import 'package:shop_app/src/core/tools/file_importers.dart';

class ProfileProvider extends ChangeNotifier {
  List<ProductModel> favoriteProducts = [];

  String? firstName;
  String? lastName;

  // void updateUser(BuildContext context) async {
  //   final authProvider = Provider.of<AuthProvider>(context, listen: false);

  //   if (firstName == null || lastName == null) {
  //     showSnackBar(context, "Please fill in all fields");
  //   } else {
  //     await AuthService.updateUser(
  //       authProvider.user!.copyWith(
  //         fullName: "$firstName $lastName",
  //       ),
  //     );
  //     if (context.mounted) {
  //       Navigator.pop(context);
  //     }
  //     authProvider.initialize(context);
  //     notifyListeners();
  //   }
  // }

  void initialize(BuildContext context) {
    favoriteProducts.clear();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    List<int> productsId = authProvider.user?.favoriteProducts ?? [];

    for (final id in productsId) {
      final product = homeProvider.products.firstWhere((item) => item.id == id);
      favoriteProducts.add(product);
    }
  }

  void deleteFavoriteProduct(ProductModel product, BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    favoriteProducts.remove(product);
    authProvider.user!.favoriteProducts.remove(product.id);
    notifyListeners();
    authProvider.updateUser2();
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
