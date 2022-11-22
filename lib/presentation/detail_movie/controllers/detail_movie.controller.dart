import 'package:get/get.dart';
import 'package:movie_app/data/detail_movie/models/detail_movies_model.dart';
import 'package:movie_app/domain/usecases/get_detail_movie.dart';

class DetailMovieController extends GetxController {
  DetailMovieController({required GetDetailMovieUsecase usecase}) {
    movieUsecase = usecase;
  }
  late GetDetailMovieUsecase movieUsecase;
  int _currentPage = 1;
  var movie = DetailMovie().obs;
  var idMovie = 0.obs;
  var isLoading = true.obs;

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
