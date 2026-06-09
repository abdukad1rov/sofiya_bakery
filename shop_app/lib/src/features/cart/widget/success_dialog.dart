import 'package:flutter/cupertino.dart';
import 'package:shop_app/src/core/tools/file_importers.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(context.l10n.success),
      content: Column(
        children: [
          CircleAvatar(
            radius: 25.sp,
            backgroundColor: Colors.green,
            child: Icon(
              Icons.check,
              size: 20.sp,
              color: Colors.white,
            ),
          ),
          Text(
            context.l10n.orderPlaced,
            style: Styles.poppins400.copyWith(fontSize: 14.sp),
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    // if (Platform.isIOS) {
    //   return CupertinoAlertDialog(
    //     title: const Text('Success'),
    //     content: const Text('Your order has been successfully placed'),
    //     actions: [
    //       CupertinoDialogAction(
    //         child: const Text('OK'),
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         },
    //       ),
    //     ],
    //   );
    // } else {
    //   return AlertDialog(
    //     title: const Text('Success'),
    //     content: const Text('Your order has been successfully placed'),
    //     actions: [
    //       TextButton(
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         },
    //         child: const Text('OK'),
    //       ),
    //     ],
    //   );
    // }
  }
}
