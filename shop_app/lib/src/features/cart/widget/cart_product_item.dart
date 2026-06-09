import 'package:shop_app/src/core/tools/file_importers.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    required this.product,
    super.key,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: double.infinity,
        height: 100.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16.sp),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.sp),
                  bottomLeft: Radius.circular(16.sp),
                ),
                child: CachedNetworkImage(
                  imageUrl: "${Config.media}${product.image}",
                  width: 110.w,
                  height: 100.h,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 180.w,
                    child: Text(
                      product.name,
                      style: Styles.poppins700.copyWith(fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    cartProvider.calculatePrice(product, context),
                    style: Styles.poppins700.copyWith(fontSize: 16.sp),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () => cartProvider.addProduct(product, context),
                    icon: const Icon(Icons.add),
                  ),
                  Text(
                    '${product.count}',
                    style: Styles.poppins600.copyWith(fontSize: 14.sp),
                  ),
                  IconButton(
                    onPressed: () =>
                        cartProvider.removeProduct(product, context),
                    icon: const Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
