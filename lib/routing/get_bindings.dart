import 'package:get/get.dart';
import 'package:personel_yonetim/controllers/auth_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/personel_controller.dart';
import '../controllers/sign_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class SignBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignController>(() => SignController());
  }
}

class PersonelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonelController>(() => PersonelController());
  }
}
