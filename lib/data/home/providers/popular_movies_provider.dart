import 'package:get/get.dart';
import 'package:movie_app/config.dart';
import 'package:movie_app/infrastructure/utils.dart';

import '../models/popular_movies_model.dart';

class PopularMoviesProvider extends GetConnect {
  Map<String, String> env = ConfigEnvironments.getEnvironments();
  Future<PopularMovies?> getPopularMovies(int page) async {
    final response =
        await get('${env['url']}/popular?api_key=${env['apiKey']}&page=$page');

    return PopularMovies.fromJson(response.body);
  }
}
