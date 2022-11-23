import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/home/controllers/home.controller.dart';
import 'package:movie_app/presentation/home/widgets/card.dart';
import 'package:movie_app/presentation/widgets/texts.dart';
import 'package:number_pagination/number_pagination.dart';

class TopRatedMovie extends GetView<HomeController> {
  const TopRatedMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MovieTheme.of(context).primaryBackground,
      appBar: AppBar(
        title: TextH6(text: 'Top Rated Movies'),
        centerTitle: true,
        backgroundColor: MovieTheme.of(context).primaryBackground,
        shadowColor: MovieTheme.of(context).secondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                MasonryGridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 10,
                  itemCount: controller.topRatedMovies()!.results!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 260,
                      child: InkWell(
                        onTap: () => controller.toDetail(
                            controller.topRatedMovies()!.results![index].id),
                        child: TopRatedCard(
                          controller: controller,
                          index: index,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                NumberPagination(
                  onPageChanged: (int pageNumber) {
                    controller.fetchDataTopRated(pageNumber);
                  },
                  pageTotal: controller.topRatedMovies()!.totalPages! <= 500
                      ? controller.topRatedMovies()!.totalPages!
                      : 500,
                  pageInit: 1, // picked number when init page
                  colorPrimary: MovieTheme.of(context).secondaryBackground,
                  colorSub: MovieTheme.of(context).secondaryColor,
                  threshold: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
