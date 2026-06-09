import 'package:shop_app/src/core/tools/file_importers.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    this.increment,
    this.decrement,
  });

  final VoidCallback? increment;
  final VoidCallback? decrement;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.sp),
                topRight: Radius.circular(25.sp),
              ),
              child: product.image.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return ProductDetail(
                                product: product,
                                increment: () => increment!(),
                                decrement: () => decrement!(),
                              );
                            });
                      },
                      child: CachedNetworkImage(
                        errorListener: (value) => const Icon(Icons.error),
                        fit: BoxFit.scaleDown,
                        imageUrl: '${Config.media}${product.image}',
                        height: 120,
                        width: double.infinity,
                      ),
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: product.name.isNotEmpty
                  ? Text(
                      product.name,
                      textAlign: TextAlign.center,
                      style: Styles.poppins700.copyWith(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 16,
                        width: 100,
                        color: Colors.white,
                      ),
                    ),
            ),
            product.price.isNotEmpty
                ? Text(
                    "${double.parse(product.price).toInt()} ₸",
                    style: Styles.poppins700.copyWith(fontSize: 14),
                  )
                : Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 16,
                      width: 60,
                      color: Colors.white,
                    ),
                  ),
            const Divider(),
            product.count == 0
                ? GestureDetector(
                    onTap: () => increment!(),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_bag_outlined,
                            color: AppColors.mainColor,
                          ),
                          Text(
                            ' ${context.l10n.addToCart}',
                            style: Styles.poppins600.copyWith(
                              fontSize: 13,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => decrement!(),
                        icon: const Icon(Icons.remove),
                      ),
                      Text(
                        "${product.count}",
                        style: Styles.poppins700.copyWith(fontSize: 14),
                      ),
                      IconButton(
                        onPressed: () => increment!(),
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
            SizedBox(height: 6.h),
          ],
        ),
      ),
    );
  }
}
