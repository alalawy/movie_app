import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/data/detail_movie/repositories/detail_movies_repository_impl.dart';
import 'package:movie_app/domain/usecases/get_detail_movie.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/detail_movie/widgets/badges.dart';
import 'package:movie_app/presentation/detail_movie/widgets/header.dart';
import 'package:movie_app/presentation/detail_movie/widgets/score.dart';
import 'package:movie_app/presentation/detail_movie/widgets/shimmer.dart';
import 'package:movie_app/presentation/widgets/texts.dart';
import 'package:shimmer/shimmer.dart';

import 'controllers/detail_movie.controller.dart';

class DetailMovieScreen extends GetView<DetailMovieController> {
  DetailMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MovieTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: Obx(
          () => !controller.isLoading()
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: MediaQuery.of(context).size.width,
                        height: Get.height * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              'https://image.tmdb.org/t/p/w1280${controller.movie().posterPath!}',
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HeaderDetail(),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SecondaryBadges(
                                    text: 'HD',
                                  ),
                                  SizedBox(
                                    width: 280,
                                    height: 35,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        reverse: true,
                                        itemCount:
                                            controller.movie().genres!.length,
                                        itemBuilder: ((context, index) =>
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: FrostBadges(
                                                text:
                                                    '${controller.movie().genres![index].name}',
                                              ),
                                            ))),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Score(data: controller.movie()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextH1(
                        text: '${controller.movie().title}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextH8(
                        text: '${controller.movie().tagline}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextH8(
                        text: '${controller.movie().overview}',
                        color: MovieTheme.of(context).secondaryText,
                      ),
                    )
                  ],
                )
              : const DetailMovieShimmer(),
        ),
      ),
    );
  }
}
