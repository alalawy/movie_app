import 'package:flutter/material.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/widgets/button.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

class Recommend extends StatelessWidget {
  const Recommend({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextH6(
                text: 'We Recommend',
              ),
              ButtonWidget(
                  text: 'See All',
                  onPressed: () {},
                  options: ButtonOptions(
                    borderRadius: BorderRadius.circular(15),
                    width: 80,
                    height: 30,
                    color: MovieTheme.of(context).primaryBackground,
                    textStyle: MovieTheme.of(context).subtitle2.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: double.infinity,
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Container(
                        width: 150,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Colors.grey[900],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/f1dd9298309425.5ed925600cd4f.jpg',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(15)));
                  })),
            ),
          )
        ],
      ),
    );
  }
}
