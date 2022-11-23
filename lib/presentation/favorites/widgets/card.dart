import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/home/models/popular_movies_model.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/favorites/controllers/favorites.controller.dart';
import 'package:movie_app/presentation/widgets/icon_button.dart';
import 'package:movie_app/presentation/widgets/my_flutter_app_icons.dart';
import 'package:movie_app/presentation/widgets/texts.dart';
import 'package:timeago/timeago.dart' as timeago;

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
          decoration: BoxDecoration(
            color: MovieTheme.of(context).lineColor,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 130,
          child: Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    image: CachedNetworkImageProvider(
                        'https://image.tmdb.org/t/p/w1280${controller.movies()[index!].backdropPath}'))),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(0, 0, 0, 0),
                      MovieTheme.of(context).primaryBackground
                    ],
                  )),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.size.width * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextH7(text: controller.movies()[index!].title),
                          Row(
                            children: [
                              TextH10(
                                text: 'Release Date : ',
                                color: MovieTheme.of(context).secondaryText,
                              ),
                              TextH10(
                                text: timeago.format(
                                    controller.movies()[index!].releaseDate!),
                                color: MovieTheme.of(context).secondaryText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    MovieIconButton(
                        buttonSize: 30,
                        onPressed: () => controller.addFavorite(
                            Result(id: controller.movies()[index!].id)),
                        icon: Icon(MovieIcons.kheart3Fill,
                            size: 20,
                            color: MovieTheme.of(context).secondaryColor)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
