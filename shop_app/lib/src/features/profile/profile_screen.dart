import 'package:shop_app/src/core/tools/file_importers.dart';
import 'package:shop_app/src/features/profile/widget/user_info_screen.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountDrawer(),
          CustomListTile(
            icon: Icons.person,
            text: context.l10n.myInfo,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserInfoScreen(),
                ),
              );
            },
          ),
          _buildDashedDivider(),
          CustomListTile(
            icon: Icons.shopping_bag,
            text: context.l10n.myOrder,
            onTap: () {
              final orderProvider =
                  Provider.of<OrderProvider>(context, listen: false);
              orderProvider.initialize(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      title: Text(context.l10n.myOrder),
                    ),
                    body: const OrderScreen(),
                  ),
                ),
              );
            },
          ),
          _buildDashedDivider(),
          // CustomListTile(
          //   icon: Icons.location_on,
          //   text: context.l10n.myLocation,
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const LocationScreen(),
          //       ),
          //     );
          //     final geoLocationProvider =
          //         Provider.of<GeoLocationProvider>(context, listen: false);
          //     geoLocationProvider.getCurrentPosition();
          //   },
          // ),
          CustomListTile(
            icon: Icons.favorite,
            text: context.l10n.favoriteProducts,
            onTap: () {
              Provider.of<ProfileProvider>(context, listen: false)
                  .initialize(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteProductScreen(),
                ),
              );
            },
          ),

          const SizedBox(height: 24),
          CustomListTile(
            icon: Icons.phone,
            text: context.l10n.contact,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactScreen(),
                ),
              );
            },
          ),
          _buildDashedDivider(),
          CustomListTile(
            icon: Icons.info,
            text: context.l10n.aboutApplications,
            onTap: () {},
          ),
          const SizedBox(height: 32),
          CustomListTile(
            icon: Icons.exit_to_app,
            text: context.l10n.logout,
            onTap: () => authProvider.logout(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDashedDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 48, right: 26),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dashCount = (constraints.maxWidth / 6).floor();
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(dashCount, (index) {
              return Container(
                width: 3,
                height: 1,
                color: Colors.grey,
                margin: const EdgeInsets.symmetric(horizontal: 1.5),
              );
            }),
          );
        },
      ),
    );
  }
}
