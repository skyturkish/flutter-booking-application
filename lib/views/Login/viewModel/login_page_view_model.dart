import 'package:flutter/material.dart';
import 'package:flutter_booking_application/views/Login/view/login_page_view.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class LoginPageViewModel extends State<LoginView> {
  final String login = 'Login';
  final String loginPicture = 'assets/png/LoginPicture.png';
  final Uri _url = Uri.parse('https://docs.flutter.dev/tos');

  void launchUrlFunction() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
