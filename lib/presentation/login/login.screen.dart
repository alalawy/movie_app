import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MovieTheme.of(context).primaryBackground,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  'https://wallpapers.com/images/hd/best-aesthetic-hd-john-wick-still-dgtne5mx4fzois4r.jpg',
                ))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.size.height * 0.4),
              TextH3(
                text: 'Welcome to Paras Movie',
              ),
              const SizedBox(height: 30),
              TextH6(
                text: 'Enjoy your favorites movie \neverywhere',
              ),
              Expanded(child: Container()),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () => controller.signin(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              'https://cdn-teams-slug.flaticon.com/google.jpg',
                          width: 35,
                        ),
                        const SizedBox(width: 20),
                        TextH7(
                          text: 'Login With Google',
                          color: Colors.black,
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
