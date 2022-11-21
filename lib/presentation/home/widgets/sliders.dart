import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

class Sliders extends StatefulWidget {
  const Sliders({super.key});

  @override
  State<Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: TextH7(
            text: 'Popular',
            color: MovieTheme.of(context).secondaryColor,
            weight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 5),
          child: Container(
            width: 60,
            height: 2,
            color: MovieTheme.of(context).secondaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CarouselSlider(
            options: CarouselOptions(
                height: 350.0,
                viewportFraction: 0.7,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height),
            items: [
              'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/f1dd9298309425.5ed925600cd4f.jpg',
              'https://images-cdn.ubuy.co.id/8I0IDCQM-mingki-john-wick-keanu-reeves-movie.jpg',
              'https://s1.bukalapak.com/img/62373851621/large/data.png'
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              i,
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color:
                                          MovieTheme.of(context).secondaryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: TextH8(
                                      text: 'HD',
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextH2(
                              text: 'Joker',
                              weight: FontWeight.bold,
                            )
                          ],
                        ),
                      ));
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
