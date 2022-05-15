import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_booking_application/views/Login/model/user_login_model_post.dart';
import 'package:flutter_booking_application/views/Login/service/login_service.dart';
import 'package:flutter_booking_application/views/Login/viewModel/login_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(ILoginService loginService)
      : _loginService = loginService,
        super(const LoginState());


  final ILoginService _loginService;

  Future<void> loginUser(Login loginUser) async {
    emit(state.copyWith(isLoading: true));
    final response = await _loginService.login(loginUser);
  

    emit(state.copyWith(isLoading: false));
  }
}
