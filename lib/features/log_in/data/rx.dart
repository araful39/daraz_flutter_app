import 'dart:developer';

import 'package:daraz_app/features/home/presentation/home_screen.dart';
import 'package:daraz_app/features/log_in/data/api.dart';
import 'package:daraz_app/features/log_in/model/login_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../constants/app_constants.dart';
import '../../../../../helpers/di.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/rx_base.dart';

class LoginRx extends RxResponseInt<LoginResposne> {
  final api = LoginApi.instance;
  LoginRx({required super.empty, required super.dataFetcher});
  ValueStream get valueStreamData => dataFetcher.stream;

  Future<bool> loginFunc({
    required String email,
    required String password,
  }) async {
    try {
      EasyLoading.show();
      LoginResposne data = await api.loginData(
        email: email,
        password: password,
      );
      EasyLoading.dismiss();
      return await handleSuccessWithReturn(data);
    } catch (error) {
      log("eeee $error");
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    await EasyLoading.showSuccess( "Login Success");

    String accessToken = data.token!;

    await appData.write(kKeyAccessToken, accessToken);

    log("${appData.read(kKeyIsLoggedIn)}");
    dataFetcher.sink.add(data);
    DioSingleton.instance.update(accessToken);
    log('Access token saved: $accessToken');

      Get.off(() => HomeScreen());
    return true;
  }

  @override
  handleErrorWithReturn(error) async {
    if (error is DioException) {
      String message = error.response?.data["message"];
      if (error.type == DioExceptionType.connectionError) {
        message = "Check Your Network Connection";
      }
      await EasyLoading.showError(message);

      await Future.delayed(Duration(seconds: 2));
    }
    return false;
  }
}
