import 'package:get/get.dart';
import 'package:movie_app/config.dart';
import 'package:movie_app/infrastructure/utils.dart';

import '../models/top_rated_movies_model.dart';

class TopRatedMoviesProvider extends GetConnect {
  Map<String, String> env = ConfigEnvironments.getEnvironments();
  Future<TopRatedMovies?> getTopRatedMovies(int page) async {
    final response = await get(
        '${env['url']}/top_rated?api_key=${env['apiKey']}&page=$page');

    return TopRatedMovies.fromJson(response.body);
  }
}
