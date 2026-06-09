import 'package:shop_app/src/core/models/branch_model.dart';
import 'package:shop_app/src/core/tools/file_importers.dart';

class HomeService {
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: Config.baseUrl,
      contentType: 'application/json',
      followRedirects: true,
      maxRedirects: 5,
    );

  static Future<List<ProductModel>?> getAllProducts() async {
    try {
      Response response = await _dio.get('/products');

      if (response.statusCode == 200) {
        List<dynamic> productList = response.data['products'];
        List<ProductModel> products =
            productList.map((json) => ProductModel.fromJson(json)).toList();
        info('Products loaded successfully');
        return products;
      } else {
        warning('Failed to load products. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      fatal('Error fetching products: $e');
      return null;
    }
  }

  static Future<List<CategoryModel>?> getAllCategories() async {
    try {
      Response response = await _dio.get('/categories');

      if (response.statusCode == 200) {
        List<dynamic> categoryList = response.data['categories'];
        List<CategoryModel> categories =
            categoryList.map((json) => CategoryModel.fromJson(json)).toList();
        info('Category loaded successfully');
        return categories;
      } else {
        warning(
            'Failed to load categories. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      fatal('Error fetching categories: $e');
      return null;
    }
  }

  static Future<List<PosterModel>?> getAllPosters() async {
    try {
      Response response = await _dio.get('/poster');

      if (response.statusCode == 200) {
        List<dynamic> posterList = response.data['poster'];

        List<PosterModel> poster =
            posterList.map((json) => PosterModel.fromJson(json)).toList();

        info('Poster loaded successfully');
        return poster;
      } else {
        warning('Failed to load poster. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      fatal('Error fetching Poster: $e');
      return null;
    }
  }

  static Future<List<BranchModel>> getBranches() async {
    try {
      final Response response = await _dio.get('/branches');

      if (response.statusCode == 200) {
        List<BranchModel> branches = (response.data['branches'] as List)
            .map((branch) => BranchModel.fromJson(branch))
            .toList();
        info('Branch loaded successfully');
        return branches;
      } else {
        warning('Branch is Empty');
        return [];
      }
    } catch (e) {
      fatal('Error fetching branches: $e');
      return [];
    }
  }
}
