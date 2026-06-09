import 'package:shop_app/src/core/models/branch_model.dart';
import 'package:shop_app/src/core/tools/file_importers.dart';

class HomeProvider extends ChangeNotifier {
  List<CategoryModel> categories = [];
  List<ProductModel> products = [];
  List<PosterModel> poster = [];
  List<ProductModel> categoryProduct = [];
  List<BranchModel> branches = [];

  bool isLoading = false;

  Locale get locale => Locale(DBService.languageCode);

  void changeLocale(Locale newLocale) async {
    DBService.languageCode = newLocale.languageCode;
    notifyListeners();
  }

  void initialize() async {
    poster = await HomeService.getAllPosters() ?? [];
    categories = await HomeService.getAllCategories() ?? [];
    products = await HomeService.getAllProducts() ?? [];
    branches = await HomeService.getBranches();
    isLoading = true;
    notifyListeners();
  }

  bool isFavoriteProduct(ProductModel product, BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    List<int> favoriteProductsList = authProvider.user!.favoriteProducts;

    return favoriteProductsList.contains(product.id);
  }

  void addFavoriteProduct(ProductModel product, BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (authProvider.user == null) return;

    List<int> favoriteProductsList = authProvider.user!.favoriteProducts;

    if (favoriteProductsList.contains(product.id)) {
      authProvider.user!.favoriteProducts.remove(product.id);
    } else {
      authProvider.user!.favoriteProducts.add(product.id);
    }
    authProvider.updateUser2();
    notifyListeners();
  }

  void getProductsByCategory(int categoryId) async {
    categoryProduct =
        products.where((product) => product.categoryId == categoryId).toList();
    notifyListeners();
  }

  void count0Product() {
    for (int i = 0; i < products.length; i++) {
      products[i] = products[i].copyWith(count: 0);
    }
    notifyListeners();
  }
}
