

import 'package:daraz_app/util/app_constants/app_constants.dart';
import 'package:daraz_app/util/helper/sharepreference_class.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/remote/dio/dio_client.dart';
import 'core/network/remote/dio/logging_interceptor.dart';


final sl = GetIt.instance;

Future<void> init() async {
  /// Core
  sl.registerLazySingleton(
    () => DioClient(
      AppConstants.baseUrl,
      sl(),
      loggingInterceptor: sl(),
      sharedPreferences: sl(),
    ),
  );

  // /// Repository
  // sl.registerLazySingleton(() => SignInRepo(dioClient: sl(), sharedPreferencesClass: sl()));
  // sl.registerLazySingleton(() => ChoreBoardRepo(dioClient: sl(),));
  // sl.registerLazySingleton(() => FamilyFlowRepo(dioClient: sl(),));
  // sl.registerLazySingleton(() => VaultRepo(dioClient: sl(),));
  // sl.registerLazySingleton(() => HomeScopeRepo(dioClient: sl(),));
  // sl.registerLazySingleton(() => BudgetRepo(dioClient: sl(),));
  // sl.registerLazySingleton(() => CommunityRepo(dioClient: sl(),));
  // sl.registerLazySingleton(() => SupportRepo(dioClient: sl(),));
  // sl.registerLazySingleton(() => SettingsRepo(dioClient: sl(),));

  // sl.registerLazySingleton(() =>  WattSaveRepo(dioClient: sl(),));

  // /// Controller
  // //splash
  // Get.lazyPut(() => SplashController(),fenix: true);

  // Get.lazyPut(() => SignInController(dioClient: sl(), signInRepo: sl(),sharedPreferencesClass: sl()),fenix: true);

  // // Chore Board
  // Get.lazyPut(() => ChoreBoardController(dioClient: sl(),choreRepo: sl()),fenix: true);

  // Get.lazyPut(() => SignUpController(),fenix: true);
  // Get.lazyPut(() => VaultController(dioClient:sl(),vaultRepo:sl()),fenix: true);
  // Get.lazyPut(() => WattSaveController(dioClient:sl(),wattSaveRepo:sl()),fenix: true);
  // Get.lazyPut(() => CustomDrawerController(),fenix: true);
  // Get.lazyPut(() => AddMortgageController(),fenix: true);

  // //home scope
  // Get.lazyPut(() => HomeScopeCreateNewController(dioClient: sl(),homeScopeRepo: sl()),fenix: true);
  // Get.lazyPut(() => AddNewBudgetController(budgetRepo:sl(), dioClient: sl()),fenix: true);

  // // family flow
  // Get.lazyPut(() => FamilyFlowController(dioClient: sl(),familyFlowRepo: sl()),fenix: true);

  // //Community
  // Get.lazyPut(() => CommunityController(dioClient: sl(),communityRepo: sl()),fenix: true);

  // // Support
  // Get.lazyPut(() =>GetSupportController(dioClient: sl(),supportRepo: sl()),fenix: true);

  // // setting
  // Get.lazyPut(() =>SettingsController(dioClient: sl(),settingsRepo: sl()),fenix: true);

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

  //register
  sl.registerLazySingleton(() => SharedPreferencesClass());
}
