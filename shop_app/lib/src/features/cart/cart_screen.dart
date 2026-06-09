import 'package:flutter/cupertino.dart';
import 'package:shop_app/src/core/tools/file_importers.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cart = cartProvider.cart;

    return cart.isEmpty
        ? const EmptyScreen()
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(context.l10n.cart),
              backgroundColor: AppColors.white,
              actions: [
                IconButton(
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) => const TrashDialog(),
                    );
                  },
                  icon: const Icon(CupertinoIcons.trash),
                ),
              ],
            ),
            backgroundColor: AppColors.scaffoldColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) =>
                          CartProductItem(product: cart[index]),
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  color: AppColors.white,
                  child: Column(
                    children: [
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
                            "${cartProvider.getAllProductPrice()} ₸",
                            style: Styles.poppins600.copyWith(
                              color: AppColors.mainColor,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      SizedBox(height: 10.h),
                      CustomButton(
                          text: context.l10n.pay,
                          onPressed: () {
                            // cartProvider.createOrder(context);

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const PaymentScreen(),
                              ),
                            );
                          }),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
