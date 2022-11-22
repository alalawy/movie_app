import 'package:either_dart/src/either.dart';
import 'package:movie_app/data/home/models/top_rated_movies_model.dart';
import 'package:movie_app/data/home/providers/top_rated_movies_provider.dart';
import 'package:movie_app/domain/core/error/exceptions.dart';
import 'package:movie_app/domain/core/error/failures.dart';
import 'package:movie_app/domain/repositories/top_rated_movies_repository.dart';

class TopRatedMoviesRepositoryImpl extends TopRatedMoviesRepository {
  @override
  Future<Either<Failure, TopRatedMovies>> getTopRatedMovie(int page) async {
    try {
      final response = await TopRatedMoviesProvider().getTopRatedMovies(page);

      return Right(response!);
    } on ServerException {
      return Left(ServerFailure());
    }
    //throw UnimplementedError();
  }
}
