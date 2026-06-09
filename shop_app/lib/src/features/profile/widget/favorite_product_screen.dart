import 'package:lottie/lottie.dart';
import 'package:shop_app/src/core/style/app_lotties.dart';
import 'package:shop_app/src/core/tools/file_importers.dart';

class FavoriteProductScreen extends StatelessWidget {
  const FavoriteProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        title: Text(context.l10n.favorite),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: profileProvider.favoriteProducts.isEmpty
          ? Center(child: Lottie.asset(AppLotties.emptyBox))
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView.builder(
                itemCount: profileProvider.favoriteProducts.length,
                itemBuilder: (context, index) {
                  final product = profileProvider.favoriteProducts[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: SizedBox(
                      height: 85.h,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.sp),
                          ),
                          color: AppColors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(4.0.sp),
                                  child: CachedNetworkImage(
                                    imageUrl: "${Config.media}${product.image}",
                                    width: 90.w,
                                    height: 80.h,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10.h),
                                      SizedBox(
                                        width: 150.w,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          product.name,
                                          style: Styles.poppins700
                                              .copyWith(fontSize: 16.sp),
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        "${double.parse(product.price).toInt()} ₸",
                                        style: Styles.poppins700.copyWith(
                                          fontSize: 16.sp,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            CloseButton(onPressed: () {
                              profileProvider.deleteFavoriteProduct(
                                  product, context);
                            }),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
