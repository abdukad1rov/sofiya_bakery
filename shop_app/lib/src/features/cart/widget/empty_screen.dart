import 'package:lottie/lottie.dart';
import 'package:shop_app/src/core/style/app_lotties.dart';
import 'package:shop_app/src/core/tools/file_importers.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.cart),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Center(
            child: Lottie.asset(
              AppLotties.emptyCart,
              width: 150.sp,
              height: 150.sp,
            ),
          ),
          const SizedBox(height: 40),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  context.l10n.cartIsEmpty,
                  style: Styles.poppins900.copyWith(fontSize: 15),
                ),
              ),
              const SizedBox(
                width: 70,
                height: 4,
                child: ColoredBox(color: AppColors.mainColor),
              ),

              //button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                child: CustomButton(
                  text: context.l10n.goBack,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
