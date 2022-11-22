import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:movie_app/infrastructure/navigation/routes.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/widgets/icon_button.dart';
import 'package:movie_app/presentation/widgets/my_flutter_app_icons.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

class HeaderDetail extends StatelessWidget {
  const HeaderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MovieIconButton(
            onPressed: (() => Get.back()),
            icon: const FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.white,
              size: 20,
            ),
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 50,
            fillColor: MovieTheme.of(context).primaryBackground,
          ),
          MovieIconButton(
            onPressed: () {},
            icon: Icon(
              MovieIcons.kshareLine,
              color: MovieTheme.of(context).secondaryBackground,
            ),
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 50,
            fillColor: MovieTheme.of(context).primaryBackground,
          ),
        ],
      ),
    );
  }
}
