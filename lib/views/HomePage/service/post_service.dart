import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_booking_application/views/HomePage/model/post_model.dart';
import 'package:flutter_booking_application/views/HomePage/model/post_user_model.dart';

abstract class IPostService {
  final String key;
  final Dio networkManager;

  IPostService(this.networkManager, this.key);
  //    give from class

  Future<Map<String, dynamic>?> getPosts();

  Future<PostModel?> getPost(int index);

  Future<Map<String, dynamic>?> searchPost(String key);

  Future<Map<String, dynamic>?> getPostsbuUserId(int index);

  Future<Map<String, dynamic>?> getPostssComments(int index);

  Future<PostUserModel?> getPostUserbyUserId(int index);
}

class PostService extends IPostService {
  PostService(super.networkManager, super.key);

  @override
  Future<PostModel?> getPost(int index) async {
    try {
      Response response = await networkManager.get('/posts/$index');
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        return PostModel.fromJson(data);
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
        return data;
      }
    } on DioError catch (error) {
      _ShowDebug.ShowDieError(error, this);
    }
    return null;
  }

//  https://dummyjson.com
  @override
  Future<PostUserModel?> getPostUserbyUserId(int index) async {
    try {
      Response response = await networkManager.get('/users/$index?limit=1&select=id,firstName,lastName,image');
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        return PostUserModel.fromJson(data);
      }
    } on DioError catch (error) {
      _ShowDebug.ShowDieError(error, this);
    }
    return null;
  }

  @override
  Future<Map<String, dynamic>?> getPostsbuUserId(int index) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> getPostssComments(int index) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> searchPost(String key) {
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
