import 'package:flutter/material.dart';
import 'package:movie_app/data/detail_movie/models/detail_movies_model.dart';
import 'package:movie_app/data/home/models/popular_movies_model.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/detail_movie/controllers/detail_movie.controller.dart';
import 'package:movie_app/presentation/detail_movie/widgets/badges.dart';
import 'package:movie_app/presentation/widgets/icon_button.dart';
import 'package:movie_app/presentation/widgets/my_flutter_app_icons.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

class Score extends StatelessWidget {
  Score({super.key, this.data, this.controller});
  DetailMovie? data;
  DetailMovieController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SecondaryBadges(
              text: 'IMDB ${data!.voteAverage!.toStringAsFixed(1)}/10',
            ),
            const SizedBox(
              width: 5,
            ),
            TextH7(
              text: '${data!.voteCount}',
              color: MovieTheme.of(context).secondaryText,
            )
          ],
        ),
        Row(
          children: [
            MovieIconButton(
                onPressed: () => controller!.addFavorite(Result(
                    backdropPath: data!.backdropPath,
                    title: data!.title,
                    popularity: data!.popularity)),
                icon: Icon(
                  MovieIcons.kheart3Line,
                  size: 28,
                  color: MovieTheme.of(context).secondaryBackground,
                )),
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
