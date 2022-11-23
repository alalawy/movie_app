import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/domain/core/auth/google_auth.dart';
import 'package:movie_app/presentation/navigation/controllers/navigation.controller.dart';
import 'package:movie_app/presentation/widgets/loading.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;

  var box = GetStorage();
  var navigation = Get.put(NavigationController());

  signOut(BuildContext context) {
    loading(context);
    signOutWithGoogle();
    navigation.changePage(0);
    box.remove('user');
    box.remove('email');
    box.remove('displayName');
    box.remove('photoURL');
    Get.back();
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
