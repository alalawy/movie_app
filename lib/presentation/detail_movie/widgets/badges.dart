import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

class FrostBadges extends StatelessWidget {
  FrostBadges({super.key, this.text});
  String? text;

  @override
  Widget build(BuildContext context) {
    return TextH8(
      text: '$text',
      color: MovieTheme.of(context).primaryBackground,
    ).frosted(
      blur: 2,
      borderRadius: BorderRadius.circular(20),
      padding: EdgeInsets.all(8),
    );
  }
}

class SecondaryBadges extends StatelessWidget {
  SecondaryBadges({super.key, this.text});
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MovieTheme.of(context).secondaryColor,
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextH8(
          text: '$text',
          color: MovieTheme.of(context).primaryBackground,
          weight: FontWeight.bold,
        ),
      ),
    );
  }
}
