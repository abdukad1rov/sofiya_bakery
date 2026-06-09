import 'package:shop_app/src/core/tools/file_importers.dart';
import 'package:shop_app/src/features/splash/widget/info_view_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    authProvider.initialize(context);

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InfoViewScreen(),
              ),
            );
          },
          child: SizedBox(
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
