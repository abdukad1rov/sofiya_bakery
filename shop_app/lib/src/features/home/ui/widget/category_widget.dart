import 'package:shop_app/src/core/tools/file_importers.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final categories = homeProvider.categories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Text(
            context.l10n.categories,
            style: Styles.poppins800.copyWith(
              fontSize: 20.sp,
              color: AppColors.mainColor,
            ),
          ),
        ),
        SizedBox(
          height: 120.h,
          child: homeProvider.isLoading
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: GestureDetector(
                        onTap: () {
                          homeProvider
                              .getProductsByCategory(categories[index].id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryDetail(
                                categoryName: categories[index].name,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: SizedBox(
                                width: 70.w,
                                height: 60.h,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${Config.media}${categories[index].logo}",
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      const CategoryShimmer(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(categories[index].name),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: const CategoryLoadingShimmer(),
                  ),
                ),
        ),
      ],
    );
  }
}

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) => ClipOval(
        child: SizedBox(
          width: 80.w,
          height: 80.h,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
      );
}

class CategoryLoadingShimmer extends StatelessWidget {
  const CategoryLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: const CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.white,
        ),
      ),
    );
  }
}
