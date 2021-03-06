import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_application/product/navigator/navigator_help.dart';
import 'package:flutter_booking_application/product/widget/card/custom_card.dart';
import 'package:flutter_booking_application/views/HomePage/cache/post_cache_manager.dart';
import 'package:flutter_booking_application/views/HomePage/model/post_model.dart';
import 'package:flutter_booking_application/views/HomePage/service/post_service.dart';
import 'package:flutter_booking_application/views/HomePage/service/user_service.dart';
import 'package:flutter_booking_application/views/Login/view/login_view.dart';
import 'package:flutter_booking_application/views/Settings/view/settings_view.dart';
import 'package:flutter_booking_application/views/cache/constant/hive_constants.dart';
import 'package:flutter_booking_application/views/cache/manager/user_cache_manager.dart';
import 'package:flutter_booking_application/views/cache/model/login_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Strings
  final String baseUrl = 'https://dummyjson.com';
  //CacheManager
  late final ICacheManager<LoginModel> cacheManagerLogin;
  late final ICacheManager<PostModel> cacheManagerPost;
  LoginModel? currentUser;
// Serv'ce manager
  late final IPostService serviceManager;
  // late final IUserService userService;
//Posts
  List<PostModel>? _posts;
  LoginModel? postUser;

  @override
  void initState() {
    cacheManagerLogin = UserCacheManager(HiveConstants.cacheNameUser);
    cacheManagerPost = PostCacheManager(HiveConstants.cacheNamePost);
    serviceManager = PostService(Dio(BaseOptions(baseUrl: baseUrl)), ' bura neden var olum ben neden bunu ekledim');
    UserService(Dio(BaseOptions(baseUrl: baseUrl)));
    getUser();
    getPosts();
    super.initState();
  }

  Future<void> getPosts() async {
    await cacheManagerPost.init();

    if ((cacheManagerPost.getValues()?.isNotEmpty ?? false)) {
      _posts = cacheManagerPost.getValues();
    } else {
      final Map<String, dynamic>? datas = await serviceManager.getPosts();
      if (datas is Map) {
        _posts = (datas?["posts"] as List).map((e) => PostModel.fromJson(e)).toList();

        cacheManagerPost.addItems(_posts!);
      }
    }
    setState(() {});
  }

  Future<void> clearAll() async {
    await cacheManagerLogin.init();
    await cacheManagerLogin.clearAll();
  }

  Future<void> getUser() async {
    await cacheManagerLogin.init();
    currentUser = cacheManagerLogin.getItem(HiveConstants.cacheCurrentUser)!; // force atm????s??n
    setState(() {});
  }

  // Future<LoginModel?> getUserByPostUserId(int userId) async {
  //   return await userService.getUserByUserId(userId);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit_rounded)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit_rounded)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit_rounded)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit_rounded)),
                  IconButton(
                      onPressed: () {
                        navigateToWidget(context, const SettingsView());
                      },
                      icon: const Icon(Icons.settings)),
                  const Spacer(),
                  IconButton(
                      onPressed: () async {
                        await clearAll();
                        navigateToUntilRemove(context, const LoginView());
                      },
                      icon: const Icon(Icons.arrow_back))
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Expanded(
                      child: _posts == null
                          ? const CircularProgressIndicator()
                          : ListView.builder(
                              itemCount: _posts?.length ?? 1,
                              itemBuilder: ((context, index) {
                                return CardPost(post: _posts![index]);
                              })),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
