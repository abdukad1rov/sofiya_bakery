import 'package:shop_app/src/core/tools/file_importers.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({
    required this.categoryName,
    super.key,
  });

  final String categoryName;

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      backgroundColor: AppColors.scaffoldColor,
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 18,
                  runSpacing: 15,
                  children: List.generate(
                    provider.categoryProduct.length,
                    (index) {
                      final product = provider.categoryProduct[index];
                      return ProductItem(
                        product: product,
                        increment: () {
                          cartProvider.addProduct(product, context);
                          setState(() {});
                        },
                        decrement: () {
                          cartProvider.removeProduct(product, context);
                          setState(() {});
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
