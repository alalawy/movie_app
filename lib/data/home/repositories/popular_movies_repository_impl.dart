import 'package:either_dart/src/either.dart';
import 'package:movie_app/data/home/models/popular_movies_model.dart';
import 'package:movie_app/data/home/providers/popular_movies_provider.dart';
import 'package:movie_app/domain/core/error/exceptions.dart';
import 'package:movie_app/domain/core/error/failures.dart';
import 'package:movie_app/domain/repositories/popular_movies_repository.dart';

class PopularMoviesRepositoryImpl extends PopularMoviesRepository {
  @override
  Future<Either<Failure, PopularMovies>> getPopularMovie(int page) async {
    try {
      final response = await PopularMoviesProvider().getPopularMovies(page);

      return Right(response!);
    } on ServerException {
      return Left(ServerFailure());
    }
    //throw UnimplementedError();
  }
}
