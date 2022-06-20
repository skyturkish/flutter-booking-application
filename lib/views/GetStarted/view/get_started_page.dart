import 'package:flutter/material.dart';
import 'package:flutter_booking_application/core/constants/Colors/colors.dart';
import 'package:flutter_booking_application/core/constants/textstyles/textstyles.dart';
import 'package:flutter_booking_application/product/navigator/navigator_help.dart';
import 'package:flutter_booking_application/product/widget/button/elevated_button.dart';
import 'package:flutter_booking_application/views/GetStarted/Icons/icons_page.dart';
import 'package:flutter_booking_application/views/GetStarted/model/get_started_model.dart';
import 'package:flutter_booking_application/views/HomePage/view/home_page.dart';
import 'package:flutter_booking_application/views/Login/view/login_view.dart';
import 'package:flutter_booking_application/views/cache/constant/hive_constants.dart';
import 'package:flutter_booking_application/views/cache/manager/user_cache_manager.dart';
import 'package:flutter_booking_application/views/cache/model/login_model.dart';
import 'package:lottie/lottie.dart';

class GetStartedBuilder extends StatefulWidget {
  const GetStartedBuilder({Key? key, required this.getStarted}) : super(key: key);
  final GetStarted getStarted;

  @override
  State<GetStartedBuilder> createState() => _GetStartedBuilderState();
}

class _GetStartedBuilderState extends State<GetStartedBuilder> {
  String? user;

  late final ICacheManager<LoginModel> cacheManager;
  @override
  void initState() {
    cacheManager = UserCacheManager(HiveConstants.cacheNameUser);
    getUserIfExist();
    super.initState();
  }

  Future<void> getUserIfExist() async {
    await cacheManager.init();
    user = cacheManager.getItem(HiveConstants.cacheCurrentUser)?.firstName ?? HiveConstants.defaultString;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const double height = 36.0;

    return user == null
        ? Lottie.network('https://assets7.lottiefiles.com/packages/lf20_a2chheio.json')
        : (user != HiveConstants.defaultString
            ? const HomePage()
            : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.getStarted.page),
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
                          Text(widget.getStarted.title, style: TextStyles.avenirBlackBig),
                          Padding(
                            padding: Paddings.onlyTopLow + Paddings.horizontalLow,
                            child: Text(
                              textAlign: TextAlign.center,
                              widget.getStarted.content,
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
                                navigateToUntilRemove(
                                  context,
                                  const LoginView(),
                                );
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
              ));
  }
}

class Paddings {
  static const EdgeInsets onlyTopLow = EdgeInsets.only(top: 10.0);
  static const EdgeInsets onlyTopMedium = EdgeInsets.only(top: 16.0);
  static const EdgeInsets onlyTopSoBig = EdgeInsets.only(top: 92.0);
  static const EdgeInsets horizontalLow = EdgeInsets.symmetric(horizontal: 10.0);
}
