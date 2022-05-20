import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_booking_application/views/cache/model/login_model.dart';

abstract class IUserService {
  final Dio networkManager;

  IUserService(this.networkManager);

  Future<LoginModel?> getUserByUserId(int index);
}

class UserService extends IUserService {
  UserService(super.networkManager);

  @override
  Future<LoginModel?> getUserByUserId(int index) async {
    try {
      Response response = await networkManager.get('/users/$index');
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        return LoginModel.fromJson(data);
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
