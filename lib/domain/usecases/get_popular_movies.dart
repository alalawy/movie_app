import 'package:either_dart/either.dart';
import 'package:movie_app/data/detail_movie/models/detail_movies_model.dart';
import 'package:movie_app/domain/core/error/failures.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/repositories/popular_movies_repository.dart';
import 'package:movie_app/data/home/models/popular_movies_model.dart';

class GetPopularMoviesUsecase {
  final PopularMoviesRepository repository;

  GetPopularMoviesUsecase(this.repository);

  Future<Either<Failure, PopularMovies>> call(page) async =>
      await repository.getPopularMovie(page);
}
