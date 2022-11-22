import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/detail_movie/widgets/shimmer.dart';
import 'package:movie_app/presentation/home/controllers/home.controller.dart';
import 'package:movie_app/presentation/widgets/button.dart';
import 'package:movie_app/presentation/widgets/texts.dart';

class TopRated extends StatelessWidget {
  TopRated({super.key, this.controller});
  HomeController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextH6(
                  text: 'Top Rated Movies',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: ButtonWidget(
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
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: double.infinity,
              height: 270,
              child: Obx(
                () => controller!.topRatedMovies().isNotEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.only(left: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller!.topRatedMovies().length,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () => controller!.toDetail(
                                controller!.topRatedMovies()[index].id),
                            child: Column(
                              children: [
                                Container(
                                    width: 150,
                                    height: 200,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[900],
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                            'https://image.tmdb.org/t/p/w1280${controller!.topRatedMovies()[index].backdropPath}',
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: SizedBox(
                                    width: 150,
                                    child: Center(
                                      child: TextH8(
                                        align: TextAlign.center,
                                        text: controller!
                                            .topRatedMovies()[index]
                                            .title,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: ((context, index) => ShimmerWidget(
                              width: 150,
                              height: 200,
                              radius: 15,
                            ))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
