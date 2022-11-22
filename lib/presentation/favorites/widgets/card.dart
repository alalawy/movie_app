import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/favorites/controllers/favorites.controller.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.controller, required this.index})
      : super(key: key);

  final FavoritesController controller;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        child: Row(
          children: [
            Container(
              width: 80,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          'https://image.tmdb.org/t/p/w1280${controller.movies()[index!].backdropPath}'))),
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                TextH4(
                  text: controller.movies()[index!].title,
                ),
                TextH6(
                  text: controller.movies()[index!].popularity.toString(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
