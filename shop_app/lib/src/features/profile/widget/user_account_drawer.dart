import 'package:shop_app/src/core/tools/file_importers.dart';

class UserAccountDrawer extends StatelessWidget {
  const UserAccountDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(color: AppColors.mainColor),
      accountName: Text(
        authProvider.user?.fullName ?? 'Anony',
        style: Styles.poppins500.copyWith(
          fontSize: 14.sp,
        ),
      ),
      accountEmail: Text(
        authProvider.user?.phoneNumber ?? '***',
        style: Styles.poppins500.copyWith(
          fontSize: 14.sp,
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          "${authProvider.user?.fullName.split(' ')[0][0].toUpperCase() ?? 'A'}${authProvider.user?.fullName.split(' ')[1][0].toUpperCase() ?? 'N'}",
          style: TextStyle(fontSize: 40.0.sp),
        ),
      ),
    );
  }
}
