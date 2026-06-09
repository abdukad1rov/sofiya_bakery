import 'package:shop_app/src/core/tools/file_importers.dart';

class GetUserInfo extends StatefulWidget {
  const GetUserInfo({super.key});

  @override
  State<GetUserInfo> createState() => _GetUserInfoState();
}

class _GetUserInfoState extends State<GetUserInfo> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white10,
      body: Column(
        children: [
          MainLogo(text: context.l10n.info),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Column(
              children: [
                const SizedBox(height: 40),
                CustomInput(
                  labelText: context.l10n.firstName,
                  onChanged: (value) => authProvider.firstName = value,
                ),
                CustomInput(
                  labelText: context.l10n.lastName,
                  onChanged: (value) => authProvider.lastName = value,
                ),
                const SizedBox(height: 90),
                CustomButton(
                  text: context.l10n.enter,
                  onPressed: () {
                    authProvider.postUser(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
