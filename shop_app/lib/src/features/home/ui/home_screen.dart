import 'package:shop_app/src/core/tools/file_importers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PosterWidget(),
            CategoryWidget(),
            ProductsWidget(),
          ],
        ),
      ),
    );
  }
}
