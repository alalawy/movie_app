import 'package:get/get.dart';
import 'package:movie_app/data/home/models/popular_movies_model.dart';
import 'package:movie_app/data/home/models/top_rated_movies_model.dart'
    as topRated;
import 'package:movie_app/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/domain/usecases/get_top_rated_movies.dart';
import 'package:movie_app/infrastructure/navigation/routes.dart';
import 'package:movie_app/presentation/detail_movie/controllers/detail_movie.controller.dart';
import 'package:movie_app/presentation/screens.dart';

class HomeController extends GetxController {
  HomeController(
      {required GetPopularMoviesUsecase usecase,
      required GetTopRatedMoviesUsecase topRatedUsecase}) {
    popularMoviesUsecase = usecase;
    topRatedMoviesUsecase = topRatedUsecase;
  }
  late GetPopularMoviesUsecase popularMoviesUsecase;
  late GetTopRatedMoviesUsecase topRatedMoviesUsecase;
  int _currentPage = 1;
  var popularMovies = RxList<Result>([]);
  var topRatedMovies = RxList<topRated.Result>([]);

  var detailMovieController = Get.find<DetailMovieController>();

  fetchData(int page) async {
    _currentPage = 1;
    final response = await popularMoviesUsecase.call(page);
    response.fold(
        (failure) {}, (response) => popularMovies.assignAll(response.results!));
  }

  fetchDataTopRated(int page) async {
    _currentPage = 1;
    final response = await topRatedMoviesUsecase.call(page);
    response.fold((failure) {},
        (response) => topRatedMovies.assignAll(response.results!));
  }

  @override
  void onInit() {
    fetchData(1);
    fetchDataTopRated(1);
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
    detailMovieController.fetchData(id);
    detailMovieController.isLoading.value = true;
    Get.to(() => DetailMovieScreen());
  }
}
