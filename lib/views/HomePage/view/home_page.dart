import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_application/product/navigator/navigator_help.dart';
import 'package:flutter_booking_application/views/HomePage/cache/post_cache_manager.dart';
import 'package:flutter_booking_application/views/HomePage/model/post_model.dart';
import 'package:flutter_booking_application/views/HomePage/service/post_service.dart';
import 'package:flutter_booking_application/views/Login/view/login_view.dart';
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
  late final PostService serviceManager;
//Posts
  List<PostModel>? _posts;

  @override
  void initState() {
    cacheManagerLogin = UserCacheManager('User');
    cacheManagerPost = PostCacheManager('Posts');
    serviceManager = PostService(Dio(BaseOptions(baseUrl: baseUrl)), ' bura neden var olum ben neden bunu ekledim');
    getUser();
    getPosts();
    super.initState();
  }

  Future<void> getPosts() async {
    await cacheManagerPost.init();
<<<<<<< HEAD

    if ((cacheManagerPost.getValues()?.isNotEmpty ?? false)) {
=======
    print('bursa');
    if (cacheManagerPost.getValues()?.isNotEmpty ?? false) {
      print(cacheManagerPost.getValues()![0].body);
>>>>>>> parent of f6e83a1 (darkmode-lightmode active ----- displaying posts comp)
      _posts = cacheManagerPost.getValues();
    } else {
      print('selamlar1');

      final Map<String, dynamic>? datas = await serviceManager.getPosts();
      if (datas is Map) {
        print('adanaaaaa');
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
    currentUser = cacheManagerLogin.getItem('currentUser')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {});
      }),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await clearAll();
                navigateToUntilRemove(context, const LoginView());
              },
              icon: const Icon(Icons.arrow_back))
        ],
        title: Text(currentUser?.email ?? ' '),
      ),
      body: ListView.builder(
          itemCount: _posts?.length ?? 1,
          itemBuilder: ((context, index) {
            return Text(_posts?[index].body ?? 'adana ');
          })),
    );
  }
}
