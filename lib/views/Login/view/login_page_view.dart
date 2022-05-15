import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_booking_application/product/Utilities/Colors/colors.dart';
import 'package:flutter_booking_application/product/Utilities/Textstyles/textstyles.dart';
import 'package:flutter_booking_application/product/widget/elevated_button.dart';
import 'package:flutter_booking_application/product/widget/text_field.dart';
import 'package:flutter_booking_application/views/Login/model/user_login_model_post.dart';
import 'package:flutter_booking_application/views/Login/service/login_service.dart';
import 'package:flutter_booking_application/views/Login/viewModel/login_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String login = 'Login';
  final String loginPicture = 'assets/png/LoginPicture.png';
  final Uri _url = Uri.parse('https://docs.flutter.dev/tos');

  void launchUrlFunction() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginService(Dio(BaseOptions(baseUrl: 'https://dummyjson.com/')))),
      child: Scaffold(
        resizeToAvoidBottomInset: false, //---> keyboard açıldığında hata vermemesini sağlıyor
        body: Padding(
          padding: Paddings.allMedium + Paddings.onlyTopLow,
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
              Padding(
                padding: Paddings.onlyTopMedium,
                child: Image.asset(loginPicture),
              ),
              Form(
                child: _LoginEmailFields(
                    focusNodeTextFieldOne: focusNodeTextFieldOne,
                    nameController: nameController,
                    focusNodeTextFieldTwo: focusNodeTextFieldTwo,
                    passwordController: passwordController),
              ),
              Padding(
                padding: Paddings.onlyTopLarge,
                child: CustomElevatedButton(
                    onPressed: () {
                      context
                          .read<LoginCubit>()
                          .loginUser(Login(name: nameController.text, password: passwordController.text));
                    },
                    text: 'Log in',
                    primary: ColorsUtilities.pinkishGrey,
                    height: 44,
                    style: TextStyles.avenirWhiteMedium),
              ),
              Padding(
                padding: Paddings.onlyTopLarge,
                child: Column(
                  children: [
                    const Text("By clicking Log in, you agree to our",
                        style: TextStyle(
                            color: ColorsUtilities.greyish,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Avenir",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.center),
                    Padding(
                      padding: Paddings.onlyTopMedium,
                      child: TextButton(
                        onPressed: launchUrlFunction,
                        child: const Text("Terms of Use",
                            style: TextStyle(
                                color: ColorsUtilities.camel,
                                fontWeight: FontWeight.w900,
                                fontFamily: "Avenir",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class _LoginEmailFields extends StatelessWidget {
  const _LoginEmailFields({
    Key? key,
    required this.focusNodeTextFieldOne,
    required this.nameController,
    required this.focusNodeTextFieldTwo,
    required this.passwordController,
  }) : super(key: key);

  final FocusNode focusNodeTextFieldOne;
  final TextEditingController nameController;
  final FocusNode focusNodeTextFieldTwo;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          textInputType: TextInputType.name,
          isFocus: true,
          focusNode: focusNodeTextFieldOne,
          hintText: 'Enter Name',
          labelText: 'Name',
          controller: nameController,
        ),
        CustomTextField(
          isFocus: false,
          focusNode: focusNodeTextFieldTwo,
          textInputType: TextInputType.name,
          hintText: 'Enter password',
          labelText: 'Password',
          controller: passwordController,
        ),
      ],
    );
  }
}

class Paddings {
  static const EdgeInsets onlyTopLarge = EdgeInsets.only(top: 18.0);
  static const EdgeInsets onlyTopMedium = EdgeInsets.only(top: 12.0);
  static const EdgeInsets onlyTopLow = EdgeInsets.only(top: 6.0);
  static const EdgeInsets allMedium = EdgeInsets.all(12.0);
}
