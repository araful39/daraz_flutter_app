import 'dart:developer';
import 'package:daraz_app/features/log_in/model/login_response.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

class LoginApi {
  static final LoginApi _singleton = LoginApi._internal();
  LoginApi._internal();
  static LoginApi get instance => _singleton;
  Future<LoginResposne> loginData({
    required String email,
    required String password,
  }) async {
    log("Email is: $email");
    log("Password is: $password");

    try {
      Map<dynamic, dynamic> data = {"username": email, "password": password};
      Response response = await postHttp(Endpoints.login(), data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResposne data = LoginResposne.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}