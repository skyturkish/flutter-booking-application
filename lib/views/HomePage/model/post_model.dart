// ignore_for_file: unnecessary_this

import 'package:flutter_booking_application/views/HomePage/model/post_user_model.dart';
import 'package:flutter_booking_application/views/cache/constant/hive_constants.dart';
import 'package:hive_flutter/adapters.dart';

part 'post_model.g.dart';

@HiveType(typeId: HiveConstants.postModelTypeId)
class PostModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? body;
  @HiveField(3)
  int? userId;
  @HiveField(4)
  List<String>? tags;
  @HiveField(5)
  int? reactions;
  @HiveField(6)
  PostUserModel? postUserModel;

  void setPostUserModel(PostUserModel? postUserModelFromNetwork) {
    postUserModel = postUserModelFromNetwork;
  }

  PostModel({this.id, this.title, this.body, this.userId, this.tags, this.reactions, this.postUserModel});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
    tags = json['tags'].cast<String>();
    reactions = json['reactions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['userId'] = this.userId;
    data['tags'] = this.tags;
    data['reactions'] = this.reactions;
    return data;
  }
}
