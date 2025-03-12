import 'package:get/get.dart';

import '../views/history/history.dart';
import '../views/home/home.dart';
import '../views/splash/splash.dart';

// All routes for app pages are defined here
class AppRoutes {
  static const String splashPage = '/splash_page';
  static const String homePage = '/home_page';
  static const String historyPage = '/history_page';

  static final List<GetPage> pages = [
    GetPage(
      name: splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: historyPage,
      page: () => const HistoryPage(),
      binding: HistoryBinding(),
    ),
  ];
}
