import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_booking_application/product/model/user_login_model_get.dart';
import 'package:flutter_booking_application/views/Login/model/user_login_model_post.dart';

abstract class ILoginService {
  final Dio networkManager;

  ILoginService(this.networkManager);

  Future<LoginUser?> login(Login loginModel);

  final String loginPath = 'auth/login';
}

class LoginService extends ILoginService {
  LoginService(super.networkManager);

  @override
  Future<LoginUser?> login(Login loginModel) async {
    try {
      Response response = await networkManager.post(loginPath, data: loginModel.toJson());
      if (response.statusCode == HttpStatus.ok) {
        return response.data;
      }
    } on DioError catch (error) {
      _ShowDebug.ShowDieError(error, this);
    }
    return null;
  }
}

class _ShowDebug {
  // ignore: non_constant_identifier_names
  static void ShowDieError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('----');
    }
  }
}
