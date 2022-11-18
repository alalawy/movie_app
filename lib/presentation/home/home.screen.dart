import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/infrastructure/navigation/routes.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/widgets/button.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MovieTheme.of(context).primaryBackground,
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ButtonWidget(
                text: 'Go to Login',
                onPressed: (() => Get.toNamed(Routes.LOGIN)),
                options: ButtonOptions(
                  width: 130,
                  height: 40,
                  color: MovieTheme.of(context).primaryColor,
                  textStyle: MovieTheme.of(context).subtitle1,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ))
          ],
        ),
      ),
    );
  }
}
