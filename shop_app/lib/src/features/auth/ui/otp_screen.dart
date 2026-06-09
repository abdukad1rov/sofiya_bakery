import 'package:shop_app/src/core/tools/file_importers.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.white10,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainLogo(text: 'SMS'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          '${context.l10n.weSentSMS} +${authProvider.phoneNumber}',
                          textAlign: TextAlign.center,
                          style: Styles.poppins600.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                      TextField(
                        onChanged: (value) =>
                            authProvider.currentSmsCode = value,
                        decoration: InputDecoration(
                          labelText: context.l10n.smsCode,
                          labelStyle: const TextStyle(color: AppColors.grey),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.grey),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.black),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(6),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        context.l10n.phoneNumber,
                        style: Styles.poppins500.copyWith(
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 200),
                  CustomButton(
                    text: context.l10n.next,
                    onPressed: () {
                      authProvider.checkSmscode(context);
                    },
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
