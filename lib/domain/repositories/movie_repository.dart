import 'package:either_dart/either.dart';
import 'package:movie_app/data/detail_movie/models/detail_movies_model.dart';
import 'package:movie_app/domain/core/error/failures.dart';

abstract class MovieRepository {
  Future<Either<Failure, DetailMovie>> getMovie(int id);
}
