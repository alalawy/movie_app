import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/home/widgets/header.dart';
import 'package:movie_app/presentation/home/widgets/search.dart';
import 'package:movie_app/presentation/home/widgets/sliders.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MovieTheme.of(context).primaryBackground,
        body: Center(
          child: Column(
            children: [const Header(), Search(), Sliders()],
          ),
        ),
      ),
    );
  }
}
