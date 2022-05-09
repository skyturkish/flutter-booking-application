import 'package:flutter/material.dart';
import 'package:flutter_booking_application/product/Utilities/Colors/colors.dart';
import 'package:flutter_booking_application/product/Utilities/Textstyles/textstyles.dart';
import 'package:flutter_booking_application/product/navigator/navigator_help.dart';
import 'package:flutter_booking_application/product/widget/elevated_button.dart';
import 'package:flutter_booking_application/views/GetStarted/Icons/icons_page.dart';
import 'package:flutter_booking_application/views/GetStarted/model/get_started_model.dart';
import 'package:flutter_booking_application/views/Login-Register/Register/Login/login_page.dart';

class GetStartedBuilder extends StatelessWidget {
  const GetStartedBuilder({Key? key, required this.getStarted}) : super(key: key);
  final GetStarted getStarted;

  @override
  Widget build(BuildContext context) {
    const double height = 36.0;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(getStarted.page),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const Expanded(
            flex: 10,
            child: SizedBox.shrink(),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Text(getStarted.title, style: TextStyles.avenirBlackBig),
                Padding(
                  padding: Paddings.onlyTopLow + Paddings.horizontalLow,
                  child: Text(
                    textAlign: TextAlign.center,
                    getStarted.content,
                    style: TextStyles.avenirGreyMedium,
                  ),
                ),
                const Padding(
                  padding: Paddings.onlyTopMedium,
                  child: IconsView(number: 3),
                ),
                Padding(
                  padding: Paddings.onlyTopSoBig + Paddings.horizontalLow,
                  child: CustomElevatedButton(
                    onPressed: () {
                      navigateToUntilRemove(context, const LoginView());
                    },
                    text: 'Get Started',
                    primary: ColorsUtilities.darkGreenBlue,
                    height: height,
                    style: TextStyles.avenirWhiteMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ) /* add child content here */,
    );
  }
}

class Paddings {
  static const EdgeInsets onlyTopLow = EdgeInsets.only(top: 10.0);
  static const EdgeInsets onlyTopMedium = EdgeInsets.only(top: 16.0);
  static const EdgeInsets onlyTopSoBig = EdgeInsets.only(top: 92.0);
  static const EdgeInsets horizontalLow = EdgeInsets.symmetric(horizontal: 10.0);
}
