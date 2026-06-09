import 'package:flutter/cupertino.dart';
import 'package:shop_app/src/core/tools/file_importers.dart';

class TrashDialog extends StatelessWidget {
  const TrashDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return CupertinoAlertDialog(
      title: Text(context.l10n.confirm),
      content: Text(context.l10n.deleteConfirmation),
      actions: [
        CupertinoDialogAction(
          child: Text(
            context.l10n.cancel,
            style: Styles.poppins500.copyWith(
              color: AppColors.mainColor,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          child: Text(
            context.l10n.delete,
            style: Styles.poppins500.copyWith(
              color: AppColors.red,
            ),
          ),
          onPressed: () {
            cartProvider.deleteAllProducts(context);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
