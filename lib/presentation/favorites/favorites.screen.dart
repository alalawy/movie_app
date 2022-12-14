import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/favorites/widgets/card.dart';
import 'package:movie_app/presentation/home/widgets/header.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

import 'controllers/favorites.controller.dart';

class FavoritesScreen extends GetView<FavoritesController> {
  const FavoritesScreen({Key? key}) : super(key: key);
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    TextH4(
                      text: 'My Favorites',
                    ),
                  ],
                ),
              ),
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
