import 'package:shop_app/src/core/tools/file_importers.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => GeoLocationProvider()),
      ],
      child: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider value, Widget? child) =>
            Builder(
          builder: (context) {
            return MaterialApp(
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                scaffoldBackgroundColor: AppColors.white,
                appBarTheme: const AppBarTheme(color: AppColors.white),
              ),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: value.locale,
              debugShowCheckedModeBanner: false,
              title: 'Shop',
              home: const SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}

int checkTime() {
  DateTime now = DateTime.now();

  // Ertalab 9:00 dan kechki 18:00 gacha bo'lgan vaqt oralig'i
  DateTime startMorning = DateTime(now.year, now.month, now.day, 9); // 09:00
  DateTime endEvening = DateTime(now.year, now.month, now.day, 18); // 18:00

  // Kechki 18:00 dan keyingi kunning tungi 2:00 gacha bo'lgan vaqt oralig'i
  DateTime startEvening = DateTime(now.year, now.month, now.day, 18); // 18:00
  DateTime endNight =
      DateTime(now.year, now.month, now.day + 1, 2); // 02:00 (ertangi kun)

  if (now.isAfter(startMorning) && now.isBefore(endEvening)) {
    return 300; // Agar ertalabki 9 dan kechki 6 gacha bo'lsa, 300 qaytaradi
  } else if (now.isAfter(startEvening) && now.isBefore(endNight)) {
    return 500; // Agar kechki 6 dan tungi 2 gacha bo'lsa, 500 qaytaradi
  } else {
    return 0; // Aks holda, 0 qaytaradi
  }
}
