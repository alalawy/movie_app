import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/data/detail_movie/models/detail_movies_model.dart';
import 'package:movie_app/data/home/models/popular_movies_model.dart';
import 'package:movie_app/domain/usecases/get_detail_movie.dart';
import 'package:movie_app/infrastructure/navigation/routes.dart';

class DetailMovieController extends GetxController {
  DetailMovieController({required GetDetailMovieUsecase usecase}) {
    movieUsecase = usecase;
  }
  late GetDetailMovieUsecase movieUsecase;
  int _currentPage = 1;
  var movie = DetailMovie().obs;
  var idMovie = 0.obs;
  var isLoading = true.obs;
  var movies = RxList<Result>([]);
  final box = GetStorage();

  addFavorite(Result data) async {
    movies().add(data);
    var user = box.read('user');
    if (user != '') {
      try {
        box.remove('favorite-$user');
        // ignore: empty_catches
      } catch (e) {}
      await box.write('favorite-$user', movies);
      var data = await box.read('favorite-$user');
      print(data.first.backdropPath);
      Get.snackbar('Success', 'Success add to favorite');
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }

  fetchData(int id) async {
    _currentPage = 1;
    final response = await movieUsecase.call(id);
    response.fold((failure) {}, (response) {
      isLoading.value = false;
      movie.value = response;
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    movies().clear();
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

  void increment() => count.value++;
}
