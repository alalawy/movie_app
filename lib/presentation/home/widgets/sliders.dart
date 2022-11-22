import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/home/controllers/home.controller.dart';
import 'package:movie_app/presentation/widgets/texts.dart';
import 'package:shimmer/shimmer.dart';

class Sliders extends StatefulWidget {
  Sliders({super.key, this.controller});

  HomeController? controller;

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
          child: Obx(
            () => CarouselSlider(
                options: CarouselOptions(
                    height: 350.0,
                    viewportFraction: 0.7,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height),
                items: widget.controller!.popularMovies().isNotEmpty
                    ? widget.controller!.popularMovies().map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () => widget.controller!.toDetail(i.id),
                              child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[900],
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          'https://image.tmdb.org/t/p/w1280${i.backdropPath}',
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: MovieTheme.of(context)
                                                      .secondaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: TextH8(
                                                  text: 'HD',
                                                  color: MovieTheme.of(context)
                                                      .primaryBackground,
                                                  weight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextH2(
                                          text: '${i.title}',
                                          weight: FontWeight.bold,
                                        )
                                      ],
                                    ),
                                  )),
                            );
                          },
                        );
                      }).toList()
                    : [1, 2, 3].map((e) {
                        return Builder(builder: (BuildContext context) {
                          return SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[900]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          );
                        });
                      }).toList()),
          ),
        ),
      ],
    );
  }
}
