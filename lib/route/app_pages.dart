import 'package:daraz_app/features/home/presentation/home_screen.dart';
import 'package:daraz_app/features/log_in/presentation/login_screen.dart';
import 'package:get/get.dart';
import 'package:daraz_app/loading_screen.dart';


import '../splash_screen.dart';
import 'apps_routes.dart';

class AppPages {
  static const initial = Routes.LOADING;

  static final routes = [
    GetPage(name: Routes.LOADING, page: () => const Loading()),
    GetPage(name: Routes.SPLASH, page: () => const SplashScreen()),
    GetPage(name: Routes.LOGIN, page: () => const LoginScreen()),
    GetPage(name: Routes.HOME, page: () => const HomeScreen()),

    // GetPage(name: Routes.LOGIN, page: () => const LoginScreen()),


  ];
}
