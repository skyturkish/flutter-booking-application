import 'package:flutter/material.dart';
import 'package:flutter_booking_application/product/Utilities/Colors/colors.dart';
import 'package:flutter_booking_application/product/Utilities/Textstyles/textstyles.dart';
import 'package:flutter_booking_application/product/widget/elevated_button.dart';
import 'package:flutter_booking_application/product/widget/text_field.dart';
import 'package:flutter_booking_application/views/Login/viewModel/login_page_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginPageViewModel {
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                child: Column(
                  children: [
                    CustomTextField(
                      textInputType: TextInputType.name,
                      isFocus: true,
                      focusNode: focusNodeTextFieldOne,
                      hintText: 'Enter Name',
                      labelText: 'Name',
                    ),
                    CustomTextField(
                        isFocus: false,
                        focusNode: focusNodeTextFieldTwo,
                        textInputType: TextInputType.none,
                        hintText: 'Enter password',
                        labelText: 'Password'),
                  ],
                ),
              ),
              Padding(
                padding: Paddings.onlyTopLarge,
                child: CustomElevatedButton(
                    onPressed: () {},
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
    );
  }
}

class Paddings {
  static const EdgeInsets onlyTopLarge = EdgeInsets.only(top: 18.0);
  static const EdgeInsets onlyTopMedium = EdgeInsets.only(top: 12.0);
  static const EdgeInsets onlyTopLow = EdgeInsets.only(top: 6.0);
  static const EdgeInsets allMedium = EdgeInsets.all(12.0);
}
