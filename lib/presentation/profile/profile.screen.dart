import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/home/widgets/header.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

import 'controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  var controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MovieTheme.of(context).primaryBackground,
        body: Column(
          children: [
            const Header(),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MovieTheme.of(context).secondaryColor),
                    onPressed: () => controller.signOut(context),
                    child: TextH7(
                      text: 'Logout',
                      color: MovieTheme.of(context).primaryBackground,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
