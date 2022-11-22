import 'package:either_dart/either.dart';
import 'package:movie_app/data/detail_movie/models/detail_movies_model.dart';
import 'package:movie_app/domain/core/error/failures.dart';
import 'package:movie_app/data/home/models/popular_movies_model.dart';

abstract class PopularMoviesRepository {
  Future<Either<Failure, PopularMovies>> getPopularMovie(int page);
}
