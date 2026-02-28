import 'dart:developer';

import 'package:daraz_app/features/home/presentation/home_screen.dart';
import 'package:daraz_app/features/log_in/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:daraz_app/networks/dio/dio.dart';
import 'package:daraz_app/splash_screen.dart';
import 'constants/app_constants.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    // await Future.delayed(Durations.extralong2);
    await setInitValue();
    log("------------kkey is loggin--${appData.read(kKeyIsLoggedIn)}");
    if (appData.read(kKeyIsLoggedIn)) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SplashScreen();
    } else {
      log("------------kkey is loggin--${appData.read(kKeyIsLoggedIn)}");
      return appData.read(kKeyIsLoggedIn)
          ? const HomeScreen()
          : const LoginScreen();
    }
  }
}
