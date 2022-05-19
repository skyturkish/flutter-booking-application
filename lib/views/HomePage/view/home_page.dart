import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_application/product/navigator/navigator_help.dart';
import 'package:flutter_booking_application/product/widget/custom_card.dart';
import 'package:flutter_booking_application/views/HomePage/cache/post_cache_manager.dart';
import 'package:flutter_booking_application/views/HomePage/model/post_model.dart';
import 'package:flutter_booking_application/views/HomePage/service/post_service.dart';
import 'package:flutter_booking_application/views/HomePage/service/user_service.dart';
import 'package:flutter_booking_application/views/Login/view/login_view.dart';
import 'package:flutter_booking_application/views/Settings/view/settings_view.dart';
import 'package:flutter_booking_application/views/cache/manager/user_cache_manager.dart';
import 'package:flutter_booking_application/views/cache/model/login_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
///////////////////////////////////////////////////////////////////////////////////////////////////////
  late final Dio _dio;
  String? path;

  final String defaultPicture =
      'https://media.istockphoto.com/photos/european-short-haired-cat-picture-id1072769156?k=20&m=1072769156&s=612x612&w=0&h=k6eFXtE7bpEmR2ns5p3qe_KYh098CVLMz4iKm5OuO6Y=';

  //////////////////////////////////////////////////////////////////////////////////////////////
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
    cacheManagerLogin = UserCacheManager('User');
    cacheManagerPost = PostCacheManager('Posts');
    serviceManager = PostService(Dio(BaseOptions(baseUrl: baseUrl)), ' bura neden var olum ben neden bunu ekledim');
    UserService(Dio(BaseOptions(baseUrl: baseUrl)));
    _dio = Dio();

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

        _posts = await Future.wait(_posts!.map((e) async {
          bool isFailed = false;
          Response? response;
          try {
            response =
                await _dio.get(e.postUserModel?.image ?? '  https://robohash.org/utnonnobis.png?size=50x50&set=set1');
          } catch (_) {
            isFailed = true;
          }

          if (!isFailed) {
            if (response!.statusCode == HttpStatus.ok) {
              path = e.postUserModel!.image!;
            }
          } else {
            path = defaultPicture;
          }
          e.postUserModel!.setImage(path!);
          e.setPostUserModel(await serviceManager.getPostUserbyUserId(e.userId!));
          return e;
        }).toList());
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
    currentUser = cacheManagerLogin.getItem('currentUser')!;
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
                                //    getUserByPostUserId(_posts![index].id!);
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
