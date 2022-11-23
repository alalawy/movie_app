import 'package:get/get.dart';
import 'package:movie_app/config.dart';
import 'package:movie_app/infrastructure/utils.dart';

import '../models/detail_movies_model.dart';

class DetailMoviesProvider extends GetConnect {
  Map<String, String> env = ConfigEnvironments.getEnvironments();
  Future<DetailMovie?> getMovies(int id) async {
    final response = await get('${env['url']}/$id?api_key=${env['apiKey']}');

    return DetailMovie.fromJson(response.body);
  }
}
