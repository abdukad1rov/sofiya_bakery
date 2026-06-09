import 'package:shop_app/src/core/tools/file_importers.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderModel> orders = [];

  bool isFirstTime = true;
  bool shouldStopChecking = false;

  void initialize(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    while (true) {
      if (isFirstTime) {
        orders = authProvider.user?.orders ?? [];
        isFirstTime = false;
        notifyListeners();
      } else {
        await Future.delayed(const Duration(seconds: 5));

        authProvider.getUserWithId(DBService.userId);
        orders = authProvider.user?.orders ?? [];
        notifyListeners();
      }
    }

    //   while (!shouldStopChecking) {
    //     if (isFirstTime) {
    //       orders = authProvider.user?.orders ?? [];
    //       isFirstTime = false;
    //       notifyListeners();
    //     } else {
    //       // minute 1 qilish kerak
    //       await Future.delayed(const Duration(seconds: 5));
    //       authProvider.getUserWithId(DBService.userId);
    //       orders = authProvider.user?.orders ?? [];

    //       bool allOrdersProcessed =
    //           orders.every((order) => order.isCompleted || order.isCanceled);

    //       if (allOrdersProcessed) {
    //         shouldStopChecking = true;
    //       }

    //       notifyListeners();
    //     }
    //   }
    // }
  }
}
