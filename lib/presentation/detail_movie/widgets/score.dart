import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/detail_movie/models/detail_movies_model.dart';
import 'package:movie_app/data/home/models/popular_movies_model.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/detail_movie/controllers/detail_movie.controller.dart';
import 'package:movie_app/presentation/detail_movie/widgets/badges.dart';
import 'package:movie_app/presentation/widgets/icon_button.dart';
import 'package:movie_app/presentation/widgets/my_flutter_app_icons.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

class Score extends StatefulWidget {
  Score({super.key, this.data});
  DetailMovie? data;

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  var controller = Get.find<DetailMovieController>();

  @override
  void initState() {
    controller.checkFav(widget.data!.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SecondaryBadges(
              text: 'IMDB ${widget.data!.voteAverage!.toStringAsFixed(1)}/10',
            ),
            const SizedBox(
              width: 5,
            ),
            TextH7(
              text: '${widget.data!.voteCount}',
              color: MovieTheme.of(context).secondaryText,
            )
          ],
        ),
        Row(
          children: [
            Obx(
              () => MovieIconButton(
                  onPressed: () => controller.addFavorite(Result(
                      id: widget.data!.id,
                      backdropPath: widget.data!.backdropPath,
                      title: widget.data!.title,
                      releaseDate: widget.data!.releaseDate,
                      overview: widget.data!.overview)),
                  icon: Icon(
                    controller.isFav()
                        ? MovieIcons.kheart3Fill
                        : MovieIcons.kheart3Line,
                    size: 28,
                    color: controller.isFav()
                        ? MovieTheme.of(context).secondaryColor
                        : MovieTheme.of(context).secondaryBackground,
                  )),
            ),
            MovieIconButton(
                icon: Icon(
              MovieIcons.kbookmarkLine,
              size: 28,
              color: MovieTheme.of(context).secondaryBackground,
            )),
          ],
        )
      ],
    );
  }
}
