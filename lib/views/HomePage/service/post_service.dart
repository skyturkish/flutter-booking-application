import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_booking_application/views/cache/model/login_model.dart';

abstract class IPostService {
  final String key;
  final Dio networkManager;

  IPostService(this.networkManager, this.key);
  //    give from class

  Future<Map<String, dynamic>?> getPosts();

  Future<LoginModel?> getPost(int index);

  Future<Map<String, dynamic>?> searchPost(String key);

  Future<Map<String, dynamic>?> getPostsbuUserId(int index);

  Future<Map<String, dynamic>?> getPostssComments(int index);
}

class PostService extends IPostService {
  PostService(super.networkManager, super.key);

  @override
  Future<LoginModel?> getPost(int index) async {
    try {
      Response response = await networkManager.get('/posts/$index');
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        return LoginModel.fromJson(data);
      }
    } on DioError catch (error) {
      _ShowDebug.ShowDieError(error, this);
    }
    return null;
  }

  @override
  Future<Map<String, dynamic>?> getPosts() async {
    try {
      Response response = await networkManager.get('/posts');
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        print('adana');
        return data;
      }
    } on DioError catch (error) {
      _ShowDebug.ShowDieError(error, this);
    }
    return null;
  }

  @override
  Future<Map<String, dynamic>?> getPostsbuUserId(int index) {
    // TODO: implement getPostsbuUserId
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> getPostssComments(int index) {
    // TODO: implement getPostssComments
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> searchPost(String key) {
    // TODO: implement searchPost
    throw UnimplementedError();
  }
}

class _ShowDebug {
  // ignore: non_constant_identifier_names
  static void ShowDieError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('----');
    }
  }
}
