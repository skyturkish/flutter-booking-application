import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_application/product/navigator/navigator_help.dart';
import 'package:flutter_booking_application/views/HomePage/model/post_model.dart';
import 'package:flutter_booking_application/views/HomePage/service/post_service.dart';
import 'package:flutter_booking_application/views/Login/view/login_view.dart';
import 'package:flutter_booking_application/views/cache/manager/user_cache_manager.dart';
import 'package:flutter_booking_application/views/cache/model/login_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.loginModel}) : super(key: key);
  final LoginModel loginModel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //CacheManager
  late final ICacheManager<LoginModel> cacheManagerLogin;
  //late final ICacheManager<PostModel> cacheManagerPost;

// Serv'ce manager
  late final IPostService postServiceManager;

//Posts
  List<PostModel>? _posts;

  @override
  void initState() {
    cacheManagerLogin = UserCacheManager('User');
    postServiceManager = PostService(Dio(BaseOptions(baseUrl: 'https://dummyjson.com/posts')), 'bursa');
    fetchPosts();

    super.initState();
  }

  Future<void> fetchPosts() async {
    final data = await postServiceManager.getPosts();

    try {
      if (data is Map) {
        _posts = ((data as Map)["posts"] as List).map((e) => PostModel.fromJson(e)).toList();
        setState(() {});
      }
    } catch (e) {
      print('noluyor aq');
    }
  }

  Future<void> clearAll() async {
    await cacheManagerLogin.init();
    await cacheManagerLogin.clearAll();
  }

  @override
  Widget build(BuildContext context) {
    print(_posts?[0].body ?? ' adana');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await clearAll();
                navigateToUntilRemove(context, const LoginView());
              },
              icon: const Icon(Icons.arrow_back))
        ],
        title: Text(widget.loginModel.id.toString()),
      ),
    );
  }
}
