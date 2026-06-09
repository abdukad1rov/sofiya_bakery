import 'package:lottie/lottie.dart';
import 'package:shop_app/src/core/style/app_lotties.dart';
import 'package:shop_app/src/core/tools/file_importers.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Column(
        children: [
          Expanded(
            child: OrderWidget(),
          ),
        ],
      ),
    );
  }
}

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    return orderProvider.orders.isEmpty
        ? Center(child: Lottie.asset(AppLotties.emptyBox))
        : ListView.builder(
            itemCount: orderProvider.orders.length,
            itemBuilder: (context, index) {
              final order =
                  orderProvider.orders[orderProvider.orders.length - 1 - index];
              return OrderCard(order: order);
            },
          );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    required this.order,
    super.key,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const ProccesScreen(),
          //     ));
        },
        child: SizedBox(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.sp)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${context.l10n.orderID}: ${order.id}',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${context.l10n.status}: ${order.isCanceled ? context.l10n.canceled : order.isCompleted ? context.l10n.completed : order.isDelivered ? context.l10n.delivered : order.isProcess ? context.l10n.inProcess : order.isAccepted ? context.l10n.accepted : context.l10n.waiting}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: order.isCanceled
                          ? Colors.red
                          : order.isCompleted
                              ? Colors.green
                              : order.isDelivered
                                  ? Colors.green
                                  : order.isProcess
                                      ? Colors.orange
                                      : order.isAccepted
                                          ? Colors.green
                                          : Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.sp),
                  Text(
                    '${context.l10n.data}: ${order.createdAt.toString().substring(0, 19)}',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 8.sp),
                  Text(
                    '${context.l10n.totalAmount}: ${order.totalPrice} ₸',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
