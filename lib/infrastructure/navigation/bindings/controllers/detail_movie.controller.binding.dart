import 'package:get/get.dart';
import 'package:movie_app/data/detail_movie/repositories/detail_movies_repository_impl.dart';
import 'package:movie_app/domain/usecases/get_detail_movie.dart';

import '../../../../presentation/detail_movie/controllers/detail_movie.controller.dart';

class DetailMovieControllerBinding extends Bindings {
  @override
  void dependencies() {
    final repository = MovieRepositoryImpl();
    final usecase = GetDetailMovieUsecase(repository);
    Get.lazyPut<DetailMovieController>(
      () => DetailMovieController(usecase: usecase),
    );
  }
}
