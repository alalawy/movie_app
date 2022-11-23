import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/data/detail_movie/repositories/detail_movies_repository_impl.dart';
import 'package:movie_app/data/home/models/popular_movies_model.dart';
import 'package:movie_app/domain/usecases/get_detail_movie.dart';
import 'package:movie_app/presentation/detail_movie/controllers/detail_movie.controller.dart';
import 'package:movie_app/presentation/detail_movie/detail_movie.screen.dart';
import 'package:movie_app/presentation/sqlite/controllers/sqlite_controllers.dart';

class FavoritesController extends GetxController {
  var movies = <Result>[].obs;
  final box = GetStorage();
  dynamic response;
  var sqliteController = Get.put(SqliteController());

  final repository = MovieRepositoryImpl();

  fetchFavorite() async {
    sqliteController
        .getFavoritesList()
        .then((value) => movies.assignAll(sqliteController.movies()));
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toDetail(id) {
    final usecase = GetDetailMovieUsecase(repository);
    var detailMovieController =
        Get.put(DetailMovieController(usecase: usecase));
    detailMovieController.fetchData(id);
    detailMovieController.isLoading.value = true;
    Get.to(() => DetailMovieScreen());
  }
}
