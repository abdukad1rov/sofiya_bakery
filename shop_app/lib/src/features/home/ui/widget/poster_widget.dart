import 'package:shop_app/src/core/tools/file_importers.dart';

class PosterWidget extends StatefulWidget {
  const PosterWidget({super.key});

  @override
  State<PosterWidget> createState() => _PosterWidgetState();
}

class _PosterWidgetState extends State<PosterWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider provider, Widget? child) =>
          ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          width: double.infinity,
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(30),
            child: provider.poster.isEmpty
                ? const PosterShimmer()
                : BannerCarousel(
                    height: 200,
                    customizedIndicators: const IndicatorModel.animation(
                      width: 10,
                      height: 5,
                      spaceBetween: 2,
                      widthAnimation: 20,
                    ),
                    activeColor: AppColors.mainColor,
                    disableColor: Colors.white,
                    animation: true,
                    borderRadius: 20,
                    width: double.infinity,
                    indicatorBottom: false,
                    customizedBanners: List.generate(
                      provider.poster.length,
                      (index) => CachedNetworkImage(
                        imageUrl:
                            "${Config.media}${provider.poster[index].image}",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => const Center(
                          child: PosterShimmer(),
                        ),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class PosterShimmer extends StatelessWidget {
  const PosterShimmer({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.3),
        highlightColor: Colors.grey.withOpacity(0.5),
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
}
