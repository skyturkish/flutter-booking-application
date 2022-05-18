import 'package:flutter_booking_application/views/cache/constant/hive_constants.dart';
import 'package:flutter_booking_application/views/cache/model/login_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ICacheManager<T> {
  final String key; // we give them our box's key
  Box<T>? _box;

  ICacheManager(this.key);

  Box<T>? get getBox => _box;

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  void registerAdapters(); // we must register, so we can cache other objects

  Future<void> clearAll() async {
    await _box?.clear();
  }

  Future<void> addItems(List<T> items);
  Future<void> putItems(List<T> items);

  T? getItem(String key);
  List<T>? getValues();

  Future<void> putItem(String key, T item);
  Future<void> removeItem(String key);
}

class UserCacheManager extends ICacheManager<LoginModel> {
  UserCacheManager(super.key);

  @override
  Future<void> addItems(List<LoginModel> items) async {
    await _box?.addAll(items);
  }

  @override
  LoginModel? getItem(String key) {
    return _box?.get(key);
  }

  @override
  List<LoginModel>? getValues() {
    return _box?.values.toList();
  }

  @override
  Future<void> putItem(String key, LoginModel item) async {
    await _box?.put(key, item);
  }

  @override
  Future<void> putItems(List<LoginModel> items) async {
    await _box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.loginModelTypeId)) {
      Hive.registerAdapter(LoginModelAdapter());
      //Hive.registerAdapter(CompanyAdapter());
    }
  }

  @override
  Future<void> removeItem(String key) async {
    await _box?.delete(key);
  }
}
