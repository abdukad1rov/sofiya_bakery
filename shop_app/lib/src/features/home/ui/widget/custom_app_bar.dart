import 'package:shop_app/src/core/tools/file_importers.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.product,
    super.key,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return AppBar(
      backgroundColor: AppColors.white,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton.filled(
          color: AppColors.white,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.mainColor),
          ),
          disabledColor: AppColors.mainColor,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: IconButton(
            onPressed: () {
              homeProvider.addFavoriteProduct(product, context);
            },
            icon: Icon(
              homeProvider.isFavoriteProduct(product, context)
                  ? Icons.favorite
                  : Icons.favorite_border,
              size: 25.sp,
              color: AppColors.mainColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
