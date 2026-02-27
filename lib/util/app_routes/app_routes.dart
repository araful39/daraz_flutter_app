
import 'package:daraz_app/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppRoutes {
  static int duration = 300;

  static final appRoutes = [

    // // defaultTransitionPage(name: LandingScreen.routeName, page: () => LandingScreen()),
    // // defaultTransitionPage(name: OnboardingScreens.routeName, page: () => OnboardingScreens()),
    // // defaultTransitionPage(name: SelectRoleScreen.routeName, page: () => SelectRoleScreen()),

    // /// Auth screen
    defaultTransitionPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
    ),

    // defaultTransitionPage(
    //   name: NotificationScreen.routeName,
    //   page: () => const NotificationScreen(),
    // ),
    // defaultTransitionPage(
    //   name: CumminutyScreen.routeName,
    //   page: () => const CumminutyScreen(),
    // ),
    // defaultTransitionPage(
    //   name: AiChatbotScreen.routeName,
    //   page: () => const AiChatbotScreen(),
    // ),
    // defaultTransitionPage(
    //   name: WrittenScreen.routeName,
    //   page: () => const WrittenScreen(),
    // ),

    // dynamicArgumentPage(
    //   name: RoomTaskScreen.routeName,
    //   pageBuilder: (args) => RoomTaskScreen(roomId: args),
    // ),
    // // defaultTransitionPage(name: RoomTaskScreen.routeName, page: () =>  RoomTaskScreen()),
  ];
}

//
GetPage defaultTransitionPage({
  required String name,
  required GetPageBuilder page,
}) {
  return GetPage(
    name: name,
    page: page,
    transition: Transition.noTransition,
    transitionDuration: Duration(milliseconds: AppRoutes.duration),
  );
}

// for argument pass route
GetPage dynamicArgumentPage({
  required String name,
  required Widget Function(dynamic args) pageBuilder,
}) {
  return GetPage(
    name: name,
    page: () => pageBuilder(Get.arguments),
    transition: Transition.noTransition,
    transitionDuration: Duration(milliseconds: AppRoutes.duration),
  );
}
