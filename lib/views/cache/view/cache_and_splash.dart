import 'package:flutter/material.dart';
import 'package:flutter_booking_application/views/HomePage/view/home_page.dart';
import 'package:flutter_booking_application/views/cache/constant/hive_constants.dart';
import 'package:flutter_booking_application/views/cache/manager/user_cache_manager.dart';
import 'package:flutter_booking_application/views/cache/model/login_model.dart';
import 'package:lottie/lottie.dart';

class CacheAndSplash extends StatefulWidget {
  const CacheAndSplash({Key? key, required this.loginModel}) : super(key: key);
  final LoginModel loginModel;
  @override
  State<CacheAndSplash> createState() => _CacheAndSplashState();
}

class _CacheAndSplashState extends State<CacheAndSplash> {
  bool isComplated = false;
  late final ICacheManager<LoginModel> cacheManager;
  @override
  void initState() {
    cacheManager = UserCacheManager(HiveConstants.cacheNameUser);
    cacheUser();
    super.initState();
  }

  Future<void> cacheUser() async {
    await cacheManager.init();
    await cacheManager.putItem(HiveConstants.cacheCurrentUser, widget.loginModel);
    isComplated = true;
    // await Future.delayed(const Duration(seconds: 4)); this provide to see loading screen

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isComplated
        ? const HomePage()
        : Scaffold(
            appBar: AppBar(),
            body: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_x62chJ.json'),
          );
  }
}
