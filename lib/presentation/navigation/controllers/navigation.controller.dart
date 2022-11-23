import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:movie_app/infrastructure/navigation/routes.dart';
import 'package:movie_app/presentation/favorites/controllers/favorites.controller.dart';
import 'package:movie_app/presentation/home/home.screen.dart';
import 'package:movie_app/presentation/screens.dart';
import 'package:movie_app/presentation/sqlite/controllers/sqlite_controllers.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();

  var currentIndex = 0.obs;
  var box = GetStorage();

  var favoriteController = Get.put(FavoritesController());
  var sqliteController = Get.put(SqliteController());
  var user = ''.obs;

  final pages = <String>[Routes.HOME, Routes.FAVORITES, Routes.PROFILE];

  void changePage(int index) {
    checkUser();
    favoriteController.fetchFavorite();
    currentIndex.value = index;
    Get.offNamedUntil(
      pages[index],
      (page) => page.settings.name == '/home',
      id: 1,
    );
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.HOME)
      // ignore: curly_braces_in_flow_control_structures
      return GetPageRoute(
        transition: Transition.noTransition,
        settings: settings,
        page: () => const HomeScreen(),
        binding: HomeControllerBinding(),
      );

    if (settings.name == Routes.FAVORITES)
      // ignore: curly_braces_in_flow_control_structures
      return GetPageRoute(
        transition: Transition.noTransition,
        settings: settings,
        page: () => Obx(
            () => user() == '' ? const LoginScreen() : const FavoritesScreen()),
        binding: user() == ''
            ? LoginControllerBinding()
            : FavoritesControllerBinding(),
      );
    if (settings.name == Routes.PROFILE)
      // ignore: curly_braces_in_flow_control_structures
      return GetPageRoute(
        transition: Transition.noTransition,
        settings: settings,
        page: () =>
            Obx(() => user() == '' ? const LoginScreen() : ProfileScreen()),
        binding: user() == ''
            ? LoginControllerBinding()
            : ProfileControllerBinding(),
      );

    return null;
  }

  checkUser() async {
    var response = await box.read('user');
    user.value = response ?? '';
  }

  @override
  void onInit() {
    sqliteController.openDb();
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
