import 'package:get/get.dart';
import 'package:movie_app/infrastructure/utils.dart';

import '../models/top_rated_movies_model.dart';

class TopRatedMoviesProvider extends GetConnect {
  Future<TopRatedMovies?> getTopRatedMovies(int page) async {
    final response =
        await get('$baseUrlData/top_rated?api_key=$apiKey&page=$page');

    return TopRatedMovies.fromJson(response.body);
  }
}
