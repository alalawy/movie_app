import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/favorites/widgets/card.dart';
import 'package:movie_app/presentation/home/widgets/header.dart';

import 'controllers/favorites.controller.dart';

class FavoritesScreen extends GetView<FavoritesController> {
  const FavoritesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MovieTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Header(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Obx(
                  () => ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.movies().length,
                      itemBuilder: (context, index) => MovieCard(
                            controller: controller,
                            index: index,
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
