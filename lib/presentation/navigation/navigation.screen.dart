import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/infrastructure/navigation/routes.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/widgets/my_flutter_app_icons.dart';

import 'controllers/navigation.controller.dart';

class NavigationScreen extends GetView<NavigationController> {
  const NavigationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MovieTheme.of(context).primaryBackground,
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: Routes.HOME,
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: MovieTheme.of(context).secondaryColor,
                blurRadius: 2,
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: MovieTheme.of(context).primaryBackground,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(MovieIcons.khome5Line),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(MovieIcons.kheartLine),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(MovieIcons.kuser3Line),
                label: 'Profile',
              ),
            ],
            currentIndex: controller.currentIndex.value,
            selectedItemColor: MovieTheme.of(context).secondaryColor,
            unselectedItemColor: MovieTheme.of(context).primaryText,
            onTap: controller.changePage,
          ),
        ),
      ),
    );
  }
}
