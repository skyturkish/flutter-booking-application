import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_booking_application/views/Login/cubit/login_cubit_state.dart';
import 'package:flutter_booking_application/views/Login/model/login_user_model.dart';
import 'package:flutter_booking_application/views/Login/service/login_service.dart';
import 'package:flutter_booking_application/views/cache/model/login_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(ILoginService loginService)
      : _loginService = loginService,
        super(const LoginState());
  final ILoginService _loginService;

  Future<LoginModel?> checkUser(LoginUser loginUser) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final loginModel = await _loginService.login(loginUser);
    emit(state.copyWith(isLoading: false, isCompleted: loginModel?.email != null));

    return loginModel;
  }
}
