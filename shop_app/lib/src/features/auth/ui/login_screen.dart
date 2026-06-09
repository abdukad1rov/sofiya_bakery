import 'package:shop_app/src/core/tools/file_importers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.white10,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainLogo(text: context.l10n.login),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    const SizedBox(height: 40),
                    TextField(
                      onChanged: (value) {
                        authProvider.phoneNumber = value;
                      },
                      decoration: InputDecoration(
                        labelText: context.l10n.phoneNumber,
                        prefix: const Text(
                          '+7',
                          style: TextStyle(color: AppColors.black),
                        ),
                        labelStyle: const TextStyle(color: AppColors.grey),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grey),
                        ),
                      ),
                      style: const TextStyle(color: AppColors.black),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ]),
                  const SizedBox(height: 200),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      text: context.l10n.next,
                      onPressed: () {
                        ValidationService.phoneNumber(
                          phoneNumber: authProvider.phoneNumber,
                          context: context,
                          successCompletion: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OtpScreen(),
                              ),
                            );
                            authProvider.sendSMS();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
