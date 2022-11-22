import 'package:either_dart/src/either.dart';
import 'package:movie_app/data/detail_movie/models/detail_movies_model.dart';
import 'package:movie_app/data/detail_movie/providers/detail_movies_provider.dart';
import 'package:movie_app/domain/core/error/exceptions.dart';
import 'package:movie_app/domain/core/error/failures.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/repositories/popular_movies_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either<Failure, DetailMovie>> getMovie(int id) async {
    try {
      final response = await DetailMoviesProvider().getMovies(id);

      return Right(response!);
    } on ServerException {
      return Left(ServerFailure());
    }
    //throw UnimplementedError();
  }
}
