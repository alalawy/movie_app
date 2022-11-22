import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.network(
            'https://c4.wallpaperflare.com/wallpaper/662/105/81/john-wick-wallpaper-preview.jpg',
            fit: BoxFit.cover,
          ).image))),
    );
  }
}
