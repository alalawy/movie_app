import 'package:flutter/material.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/detail_movie/widgets/badges.dart';
import 'package:movie_app/presentation/widgets/icon_button.dart';
import 'package:movie_app/presentation/widgets/my_flutter_app_icons.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

class Score extends StatelessWidget {
  Score({super.key, this.score, this.count});
  String? score;
  String? count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SecondaryBadges(
              text: 'IMDB $score/10',
            ),
            const SizedBox(
              width: 5,
            ),
            TextH7(
              text: '$count',
              color: MovieTheme.of(context).secondaryText,
            )
          ],
        ),
        Row(
          children: [
            MovieIconButton(
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
