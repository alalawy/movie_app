import 'package:get/get.dart';
import 'package:movie_app/infrastructure/utils.dart';

import '../models/popular_movies_model.dart';

class PopularMoviesProvider extends GetConnect {
  Future<PopularMovies?> getPopularMovies(int page) async {
    final response =
        await get('$baseUrlData/popular?api_key=$apiKey&page=$page');

    return PopularMovies.fromJson(response.body);
  }
}
