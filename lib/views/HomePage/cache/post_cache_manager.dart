import 'package:flutter_booking_application/views/HomePage/model/post_model.dart';
import 'package:flutter_booking_application/views/HomePage/model/post_user_model.dart';
import 'package:flutter_booking_application/views/cache/constant/hive_constants.dart';
import 'package:flutter_booking_application/views/cache/manager/user_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PostCacheManager extends ICacheManager<PostModel> {
  PostCacheManager(super.key);

  @override
  Future<void> addItems(List<PostModel> items) async {
    await getBox?.addAll(items);
  }

  @override
  PostModel? getItem(String key) {
    return getBox?.get(key);
  }

  @override
  List<PostModel>? getValues() {
    return getBox?.values.toList();
  }

  @override
  Future<void> putItem(String key, PostModel item) async {
    await getBox?.put(key, item);
  }

  @override
  Future<void> putItems(List<PostModel> items) async {
    await getBox?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.postModelTypeId)) {
      Hive.registerAdapter(PostModelAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveConstants.postUserModelTypeId)) {
      Hive.registerAdapter(PostUserModelAdapter());
    }
  }

  @override
  Future<void> removeItem(String key) async {
    await getBox?.delete(key);
  }
}
