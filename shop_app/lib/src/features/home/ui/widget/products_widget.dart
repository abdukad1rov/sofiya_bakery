import 'package:shop_app/src/core/tools/file_importers.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.allProducts,
              style: Styles.poppins800.copyWith(
                fontSize: 20.sp,
                color: AppColors.mainColor,
                height: 1.5.h,
              ),
            ),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 18.w,
              runSpacing: 15.sp,
              children: homeProvider.isLoading
                  ? List.generate(
                      homeProvider.products.length,
                      (index) {
                        final product = homeProvider.products[index];
                        return ProductItem(
                          product: product,
                          increment: () => value.addProduct(product, context),
                          decrement: () =>
                              value.removeProduct(product, context),
                        );
                      },
                    )
                  : List.generate(10, (index) => const ProductItemShimmer()),
            ),
          ],
        );
      },
    );
  }
}
