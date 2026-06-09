import 'package:shop_app/src/core/tools/file_importers.dart';

sealed class ValidationService {
  const ValidationService._();

  static void phoneNumber({
    required BuildContext context,
    required VoidCallback successCompletion,
    String? phoneNumber,
  }) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      _showSnackBar(context, 'Telefon raqamni kiriting');
      return;
    }

    if (phoneNumber.length != 10) {
      _showSnackBar(context, 'Telefon raqami noto\'g\'ri');
      return;
    }
    successCompletion();
  }

  static void _showSnackBar(BuildContext context, String message,
      {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? AppColors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.all(16.0),
        elevation: 6.0,
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
