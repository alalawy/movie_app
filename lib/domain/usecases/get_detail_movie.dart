import 'package:either_dart/either.dart';
import 'package:movie_app/data/detail_movie/models/detail_movies_model.dart';
import 'package:movie_app/domain/core/error/failures.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/repositories/popular_movies_repository.dart';
import 'package:movie_app/data/home/models/popular_movies_model.dart';

class GetDetailMovieUsecase {
  final MovieRepository repository;

  GetDetailMovieUsecase(this.repository);

  Future<Either<Failure, DetailMovie>> call(id) async =>
      await repository.getMovie(id);
}
