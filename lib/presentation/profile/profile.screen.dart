import 'package:cached_network_image/cached_network_image.dart';
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
        appBar: AppBar(
          toolbarHeight: 80,
          title: Header(),
          backgroundColor: MovieTheme.of(context).primaryBackground,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            controller.box.read('photoURL')))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextH6(
                text: controller.box.read('displayName'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextH8(
                text: controller.box.read('email'),
                color: MovieTheme.of(context).secondaryText,
              ),
            ),
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
