import 'package:shop_app/src/core/tools/file_importers.dart';

final class AppRunner {
  Future<void> initializeAndRun() async {
    WidgetsFlutterBinding.ensureInitialized();
    await DBService.initialize();
    runApp(const App());
  }
}
