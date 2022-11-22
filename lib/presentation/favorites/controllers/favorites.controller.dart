import 'dart:math';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/data/home/models/popular_movies_model.dart';

class FavoritesController extends GetxController {
  var movies = RxList<Result>([]);
  final box = GetStorage();
  dynamic response;

  fetchFavorite() async {
    var user = box.read('user');
    movies().clear();

    response = box.read('favorite-$user');
    print(response);
    for (var element in response!) {
      movies().add(element);
    }

    print(movies().length);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
