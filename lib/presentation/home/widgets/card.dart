import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/home/controllers/home.controller.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

class TopRatedCard extends StatelessWidget {
  TopRatedCard({Key? key, required this.controller, this.index})
      : super(key: key);

  final HomeController? controller;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 150,
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: Colors.grey[900],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    'https://image.tmdb.org/t/p/w1280${controller!.topRatedMovies()!.results![index!].backdropPath}',
                  ),
                ),
                borderRadius: BorderRadius.circular(15))),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: 150,
            child: Center(
              child: TextH8(
                align: TextAlign.center,
                text: controller!.topRatedMovies()!.results![index!].title,
              ),
            ),
          ),
        )
      ],
    );
  }
}
