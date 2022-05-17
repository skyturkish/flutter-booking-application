import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_booking_application/views/Login/model/login_user_model.dart';
import 'package:flutter_booking_application/views/cache/model/login_model.dart';

abstract class ILoginService {
  final Dio networkManager;

  ILoginService(this.networkManager);

  Future<LoginModel?> login(LoginUser user);

  final String loginPath = 'auth/login';
}

class LoginService extends ILoginService {
  LoginService(super.networkManager);

  @override
  Future<LoginModel?> login(LoginUser user) async {
    try {
      Response response = await networkManager.post(loginPath, data: user.toJson());
      if (response.statusCode == HttpStatus.ok) {
        return LoginModel.fromJson(response.data);
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
