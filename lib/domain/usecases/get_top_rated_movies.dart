import 'package:either_dart/either.dart';
import 'package:movie_app/domain/core/error/failures.dart';
import 'package:movie_app/domain/repositories/top_rated_movies_repository.dart';
import 'package:movie_app/data/home/models/top_rated_movies_model.dart';

class GetTopRatedMoviesUsecase {
  final TopRatedMoviesRepository repository;

  GetTopRatedMoviesUsecase(this.repository);

  Future<Either<Failure, TopRatedMovies>> call(page) async =>
      await repository.getTopRatedMovie(page);
}
