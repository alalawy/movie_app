import 'package:get/get.dart';
import 'package:movie_app/data/detail_movie/repositories/detail_movies_repository_impl.dart';
import 'package:movie_app/data/home/repositories/popular_movies_repository_impl.dart';
import 'package:movie_app/data/home/repositories/top_rated_movies_repository_impl.dart';
import 'package:movie_app/domain/repositories/popular_movies_repository.dart';
import 'package:movie_app/domain/usecases/get_detail_movie.dart';
import 'package:movie_app/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/domain/usecases/get_top_rated_movies.dart';
import 'package:movie_app/presentation/detail_movie/controllers/detail_movie.controller.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    final repository = PopularMoviesRepositoryImpl();
    final usecase = GetPopularMoviesUsecase(repository);
    final repositoryTopRated = TopRatedMoviesRepositoryImpl();
    final usecaseTopRated = GetTopRatedMoviesUsecase(repositoryTopRated);

    Get.lazyPut<HomeController>(
      () => HomeController(usecase: usecase, topRatedUsecase: usecaseTopRated),
    );

    final repositoryMovie = MovieRepositoryImpl();
    final usecaseMovie = GetDetailMovieUsecase(repositoryMovie);
    Get.lazyPut<DetailMovieController>(
      () => DetailMovieController(usecase: usecaseMovie),
    );
  }
}
