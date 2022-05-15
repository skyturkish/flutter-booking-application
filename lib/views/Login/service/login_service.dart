import 'package:dio/dio.dart';
import 'package:flutter_booking_application/views/Login/model/user_login_model_Get.dart';
import 'package:flutter_booking_application/views/Login/model/user_login_model_post.dart';

abstract class ILoginService {
  final Dio networkManager;

  ILoginService(this.networkManager);

  Future<LoginUser?> login(String name, String password);

  final String loginPath = 'https://dummyjson.com/auth/';
}

class LoginService extends ILoginService {
  LoginService(super.networkManager);

  @override
  Future<LoginUser?> login(String name, String password) async {
    Login login = Login(name: name, password: password);
    Response loginUser = await networkManager.post(loginPath, data: login.toJson());
    return null;
  }
}
