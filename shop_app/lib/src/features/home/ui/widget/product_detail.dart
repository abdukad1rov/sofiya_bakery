import 'package:shop_app/src/core/tools/file_importers.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    required this.product,
    required this.increment,
    required this.decrement,
    super.key,
  });

  final ProductModel product;
  final VoidCallback increment;
  final VoidCallback decrement;

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Consumer<CartProvider>(
      builder: (BuildContext context, CartProvider value, Widget? child) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.sp),
                  topRight: Radius.circular(16.sp),
                ),
              ),
              padding: EdgeInsets.all(20.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: "${Config.media}${product.image}",
                      width: 250,
                      height: 200,
                      fit: BoxFit.scaleDown,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      product.name,
                      style: Styles.poppins700.copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "${double.parse(product.price).toInt()} ₸",
                      style: Styles.poppins700.copyWith(
                        color: AppColors.mainColor,
                        fontSize: 17.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      context.l10n.productInformation,
                      style: Styles.poppins700.copyWith(fontSize: 15.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      product.description,
                      style: Styles.poppins600.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: Icon(
                  homeProvider.isFavoriteProduct(product, context)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: AppColors.mainColor,
                  size: 26.sp,
                ),
                onPressed: () {
                  homeProvider.addFavoriteProduct(product, context);
                },
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton.filled(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.mainColor),
                ),
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        );
      },
    );
  }
}
