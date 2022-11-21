import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:movie_app/infrastructure/navigation/routes.dart';
import 'package:movie_app/presentation/home/home.screen.dart';
import 'package:movie_app/presentation/screens.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>[Routes.HOME, Routes.LOGIN];

  void changePage(int index) {
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
        settings: settings,
        page: () => const HomeScreen(),
        binding: HomeControllerBinding(),
      );

    if (settings.name == Routes.LOGIN)
      // ignore: curly_braces_in_flow_control_structures
      return GetPageRoute(
        settings: settings,
        page: () => const LoginScreen(),
        binding: LoginControllerBinding(),
      );

    return null;
  }

  final count = 0.obs;
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

  void increment() => count.value++;
}
