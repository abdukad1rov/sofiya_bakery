import 'package:shop_app/src/core/tools/file_importers.dart';
import 'package:shop_app/src/features/location/location_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (BuildContext context, CartProvider provider, Widget? child) =>
          Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(context.l10n.payment),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    context.l10n.sellectAddress,
                    style: Styles.poppins600.copyWith(fontSize: 18.sp),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LocationScreen(),
                      ),
                    );
                    final geoLocationProvider =
                        Provider.of<GeoLocationProvider>(context,
                            listen: false);
                    geoLocationProvider.getCurrentPosition();
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 60.h,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.white10,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.sp),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10.w),
                          CircleAvatar(
                            radius: 20.sp,
                            backgroundColor: AppColors.mainColor,
                            child: const Icon(
                              Icons.my_location,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(context.l10n.homeLocation),
                              Consumer<GeoLocationProvider>(
                                builder: (BuildContext context,
                                        GeoLocationProvider locationProvider,
                                        Widget? child) =>
                                    Text(locationProvider.locationName ??
                                        'Not sellected location'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  context.l10n.deliveryTime,
                  style: Styles.poppins500.copyWith(
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Comment',
                  style: Styles.poppins500.copyWith(fontSize: 16.sp),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100.h,
                  child: TextField(
                    onChanged: (value) => provider.comment = value,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.mainColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    context.l10n.sellectPayment,
                    style: Styles.poppins600.copyWith(fontSize: 18.sp),
                  ),
                ),
                GestureDetector(
                  onTap: () => provider.changePayCash(true),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60.h,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.white10,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.sp),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10.w),
                              CircleAvatar(
                                radius: 20.sp,
                                backgroundColor: AppColors.mainColor,
                                child: const Icon(
                                  Icons.money,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(context.l10n.cash),
                                  Text(context.l10n.payWithCash),
                                ],
                              ),
                            ],
                          ),
                          provider.isPayCash
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: CircleAvatar(
                                    radius: 10.sp,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 15.h),
                // GestureDetector(
                //   onTap: () => provider.changePayCash(false),
                //   child: SizedBox(
                //     width: double.infinity,
                //     height: 60.h,
                //     child: DecoratedBox(
                //       decoration: BoxDecoration(
                //         color: AppColors.white10,
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(16.sp),
                //         ),
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Row(
                //             children: [
                //               SizedBox(width: 10.w),
                //               Image.asset(
                //                 AppIcons.kaspi,
                //                 width: 40.w,
                //                 height: 40.h,
                //                 fit: BoxFit.scaleDown,
                //               ),
                //               SizedBox(width: 16.w),
                //               Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   const Text('Kaspi'),
                //                   Text(context.l10n.payWithKaspi),
                //                 ],
                //               ),
                //             ],
                //           ),
                //           provider.isPayCash
                //               ? const SizedBox.shrink()
                //               : Padding(
                //                   padding:
                //                       EdgeInsets.symmetric(horizontal: 10.w),
                //                   child: CircleAvatar(
                //                     radius: 10.sp,
                //                     backgroundColor: AppColors.mainColor,
                //                   ),
                //                 ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 15.h),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.yourOrder,
                      style: Styles.poppins600.copyWith(
                        color: AppColors.mainColor,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      '${provider.getAllProductPrice()} ₸',
                      style: Styles.poppins600.copyWith(
                        color: AppColors.mainColor,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.deliveryPrice,
                      style: Styles.poppins600.copyWith(
                        color: AppColors.mainColor,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      '${provider.deliveredPrice} ₸',
                      style: Styles.poppins600.copyWith(
                        color: AppColors.mainColor,
                        fontSize: 15.sp,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.totalAmount,
                      style: Styles.poppins600.copyWith(
                        color: AppColors.mainColor,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      '${provider.getAllProductPrice() + provider.deliveredPrice} ₸',
                      style: Styles.poppins600.copyWith(
                        color: AppColors.mainColor,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                const Divider(),
                SizedBox(height: 10.h),
                CustomButton(
                  text: context.l10n.confirmOrder,
                  onPressed: () {
                    provider.createOrder(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
