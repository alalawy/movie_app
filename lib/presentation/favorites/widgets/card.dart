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
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: () => controller.toDetail(controller.movies()[index!].id),
        child: Container(
          width: double.infinity,
          height: 130,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextH4(
                    text: controller.movies()[index!].title,
                  ),
                  TextH8(
                    text: controller.movies()[index!].releaseDate.toString(),
                  ),
                  TextH8(
                    text: controller
                        .movies()[index!]
                        .overview
                        .toString()
                        .substring(0, 40),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
