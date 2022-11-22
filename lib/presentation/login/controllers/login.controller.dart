import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/domain/core/auth/auth_util.dart';
import 'package:movie_app/presentation/navigation/controllers/navigation.controller.dart';

class LoginController extends GetxController {
  var box = GetStorage();

  var navigation = Get.find<NavigationController>();

  signin(BuildContext context) async {
    var response = await signInWithGoogle(context);
    print('uid : ${response!.uid.toString()}');
    box.write('user', response.uid.toString());
    navigation.checkUser();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
