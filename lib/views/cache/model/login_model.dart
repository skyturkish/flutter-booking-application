import 'package:flutter_booking_application/views/cache/constant/hive_constants.dart';
import 'package:hive_flutter/adapters.dart';

part 'login_model.g.dart';

@HiveType(typeId: HiveConstants.loginModelTypeId)
class LoginModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? firstName;
  @HiveField(4)
  String? lastName;
  @HiveField(5)
  String? gender;
  @HiveField(6)
  String? image;
  @HiveField(7)
  String? token;

  LoginModel({this.id, this.username, this.email, this.firstName, this.lastName, this.gender, this.image, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    image = json['image'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['image'] = image;
    data['token'] = token;
    return data;
  }
}
