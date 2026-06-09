import 'package:shop_app/src/core/tools/file_importers.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.mainColor),
          minimumSize: WidgetStateProperty.all(
            const Size(double.infinity, 50),
          ),
        ),
        child: Text(
          text,
          style: Styles.poppins700.copyWith(
            color: AppColors.white,
          ),
        ),
      );
}
