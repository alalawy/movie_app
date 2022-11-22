import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';

void loading(BuildContext context) {
  Get.dialog(Center(
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MovieTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: CircularProgressIndicator(
          color: MovieTheme.of(context).secondaryColor,
        ),
      ),
    ),
  ));
}
