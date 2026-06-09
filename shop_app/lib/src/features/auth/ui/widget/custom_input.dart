import 'package:shop_app/src/core/tools/file_importers.dart';

class CustomInput extends StatelessWidget {
  final String labelText;
  final Function(String) onChanged;

  const CustomInput({
    required this.labelText,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: AppColors.grey),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
      ),
      style: const TextStyle(color: AppColors.black),
      keyboardType: TextInputType.text,
      inputFormatters: [
        LengthLimitingTextInputFormatter(30),
        FilteringTextInputFormatter.singleLineFormatter,
        FilteringTextInputFormatter.allow(
          RegExp(r'[a-zA-Zа-яА-Я]'),
        ),
      ],
    );
  }
}
