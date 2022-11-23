import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/infrastructure/navigation/routes.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/widgets/icon_button.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

class Header extends StatelessWidget {
  Header({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MovieIconButton(
            onPressed: (() => Get.toNamed(Routes.LOGIN)),
            icon: const FaIcon(
              FontAwesomeIcons.bars,
              color: Colors.white,
              size: 20,
            ),
            borderColor: MovieTheme.of(context).primaryText,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 50,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/paras.png',
                width: 35,
              ),
              TextH5(text: '  ParasMovie')
            ],
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(box.read('photoURL') ??
                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'))),
          )
        ],
      ),
    );
  }
}
