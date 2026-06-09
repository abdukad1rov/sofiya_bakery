import 'package:shop_app/src/core/tools/file_importers.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.icon,
    required this.text,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ListTile(
            leading: Icon(
              icon,
              color: AppColors.mainColor,
              size: 20.sp,
            ),
            title: Text(
              text,
              style: Styles.poppins600.copyWith(
                color: AppColors.mainColor,
                fontSize: 12.sp,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 18),
            onTap: onTap,
          ),
        ],
      );
}
