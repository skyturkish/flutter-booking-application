import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_booking_application/core/constants/Colors/colors.dart';
import 'package:flutter_booking_application/core/constants/textstyles/textstyles.dart';
import 'package:flutter_booking_application/product/navigator/navigator_help.dart';
import 'package:flutter_booking_application/product/widget/button/elevated_button.dart';
import 'package:flutter_booking_application/product/widget/textfield/text_field.dart';
import 'package:flutter_booking_application/views/Login/cubit/login_cubit.dart';
import 'package:flutter_booking_application/views/Login/cubit/login_cubit_state.dart';
import 'package:flutter_booking_application/views/Login/model/login_user_model.dart';
import 'package:flutter_booking_application/views/Login/service/login_service.dart';
import 'package:flutter_booking_application/views/cache/model/login_model.dart';
import 'package:flutter_booking_application/views/cache/view/cache_and_splash.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Controllers

  final TextEditingController namesController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //Strings
  final String login = 'Login';
  final Uri _url = Uri.parse('https://docs.flutter.dev/tos');
  final String photoUrl = 'assets/png/LoginPicture.png';
  final String baseUrl = 'https://dummyjson.com/';

  void launchUrlFunction() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginService(Dio(BaseOptions(baseUrl: baseUrl)))),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false, //---> keyboard açıldığında hata vermemesini sağlıyor

          body: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Padding(
                padding: Paddings.allMedium,
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: ColorsUtilities.charcoal,
                          )),
                      Text(login, style: TextStyles.avenirCharcoal),
                      const SizedBox.shrink()
                    ]),
                    Image.asset(photoUrl),
                    Column(
                      children: [
                        CustomTextField(
                          textInputType: TextInputType.name,
                          hintText: 'Enter name',
                          labelText: 'name',
                          controller: namesController,
                        ),
                        CustomTextField(
                          textInputType: TextInputType.name,
                          hintText: 'Enter password',
                          labelText: 'password',
                          controller: passwordController,
                        ),
                      ],
                    ),
                    Padding(
                      padding: Paddings.onlyTopLarge,
                      child: CustomElevatedButton(
                          onPressed: () async {
                            LoginModel? user = await context.read<LoginCubit>().checkUser(LoginUser(
                                username: namesController.text.replaceAll(' ', ''), password: passwordController.text));
                            if (user != null) {
                              navigateToUntilRemove(context, CacheAndSplash(loginModel: user));
                              //print(user.firstName);
                            }
                            if (user != null) {
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(content: Text(TextsLogin.passwordError)));
                            }
                          },
                          text: 'Log in',
                          primary: Colors.grey,
                          height: 48,
                          style: TextStyles.avenirCharcoal),
                    ),
                    Padding(
                      padding: Paddings.onlyTopLarge,
                      child: Column(
                        children: [
                          const Text(TextsLogin.termsOfUse,
                              style: TextStyles.avenirGreyish, textAlign: TextAlign.center),
                          Padding(
                            padding: Paddings.onlyTopMedium,
                            child: TextButton(
                              onPressed: launchUrlFunction,
                              child: const Text(TextsLogin.termsOfUse,
                                  style: TextStyles.avenirCamel, textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Paddings {
  static const EdgeInsets onlyTopLarge = EdgeInsets.only(top: 18.0);
  static const EdgeInsets onlyTopMedium = EdgeInsets.only(top: 12.0);
  static const EdgeInsets onlyTopLow = EdgeInsets.only(top: 6.0);
  static const EdgeInsets allMedium = EdgeInsets.all(12.0);
}

class TextsLogin {
  static const String termsOfUse = "Terms of Use";
  static const String youAgree = "By clicking Log in, you agree to our";
  static const String passwordError = 'name or password is wrong!!!';
}
