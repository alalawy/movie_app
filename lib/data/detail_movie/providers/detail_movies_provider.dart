import 'package:get/get.dart';
import 'package:movie_app/infrastructure/utils.dart';

import '../models/detail_movies_model.dart';

class DetailMoviesProvider extends GetConnect {
  Future<DetailMovie?> getMovies(int id) async {
    final response = await get('$baseUrlData/$id?api_key=$apiKey');

    return DetailMovie.fromJson(response.body);
  }
}
