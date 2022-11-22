import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/domain/core/auth/google_auth.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;

  var box = GetStorage();

  signOut() {
    signOutWithGoogle();
    box.erase();
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

  void increment() => count.value++;
}
