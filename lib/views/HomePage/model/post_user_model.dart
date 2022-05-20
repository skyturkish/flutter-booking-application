// ignore_for_file: unnecessary_this

import 'package:flutter_booking_application/views/cache/constant/hive_constants.dart';
import 'package:hive_flutter/adapters.dart';

part 'post_user_model.g.dart';

@HiveType(typeId: HiveConstants.postUserModelTypeId)
class PostUserModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? lastName;
  @HiveField(3)
  String? image;

  PostUserModel({this.id, this.firstName, this.lastName, this.image});

  PostUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['image'] = this.image;
    return data;
  }
}
