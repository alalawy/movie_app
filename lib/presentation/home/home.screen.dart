import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/home/widgets/header.dart';
import 'package:movie_app/presentation/home/widgets/top_rated.dart';
import 'package:movie_app/presentation/home/widgets/search.dart';
import 'package:movie_app/presentation/home/widgets/sliders.dart';
import 'package:movie_app/presentation/widgets/my_flutter_app_icons.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MovieTheme.of(context).primaryBackground,
        appBar: AppBar(
          toolbarHeight: 80,
          title: Header(),
          backgroundColor: MovieTheme.of(context).primaryBackground,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Search(),
                Sliders(controller: controller),
                TopRated(controller: controller)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
