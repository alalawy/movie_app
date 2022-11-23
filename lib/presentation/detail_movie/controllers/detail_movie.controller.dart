import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/data/detail_movie/models/detail_movies_model.dart';
import 'package:movie_app/data/home/models/popular_movies_model.dart';
import 'package:movie_app/domain/usecases/get_detail_movie.dart';
import 'package:movie_app/infrastructure/navigation/routes.dart';
import 'package:movie_app/presentation/favorites/controllers/favorites.controller.dart';
import 'package:movie_app/presentation/sqlite/controllers/sqlite_controllers.dart';

class DetailMovieController extends GetxController {
  DetailMovieController({required GetDetailMovieUsecase usecase}) {
    movieUsecase = usecase;
  }
  late GetDetailMovieUsecase movieUsecase;
  int _currentPage = 1;
  var movie = DetailMovie().obs;
  var idMovie = 0.obs;
  var isLoading = true.obs;
  var movies = RxList<Result>([]);
  List<Map<String, dynamic>> movieList = [{}];
  var isFav = false.obs;

  final box = GetStorage();
  dynamic response;

  var sqliteController = Get.put(SqliteController());
  var favoriteController = Get.find<FavoritesController>();

  addFavorite(Result result) async {
    await sqliteController.database!.transaction((txn) async {
      sqliteController
          .addOrRemoveFavorite(txn, result.id!, result)
          .then((value) {
        checkFav(result.id).then((value) {
          favoriteController.fetchFavorite();
        });
      });
    });
  }

  Future<void> checkFav(idMovie) async {
    bool data = await sqliteController.checkIsFavorites(idMovie);
    isFav.value = data;
  }

  fetchData(int id) async {
    _currentPage = 1;
    final response = await movieUsecase.call(id);
    response.fold((failure) {}, (response) {
      isLoading.value = false;
      movie.value = response;
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    movies().clear();
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

  void increment() => count.value++;
}
