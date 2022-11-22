import 'package:either_dart/either.dart';
import 'package:movie_app/domain/core/error/failures.dart';
import 'package:movie_app/data/home/models/top_rated_movies_model.dart';

abstract class TopRatedMoviesRepository {
  Future<Either<Failure, TopRatedMovies>> getTopRatedMovie(int page);
}
