import 'package:get/get.dart';
import 'package:personel_yonetim/controllers/auth_controller.dart';
import '../models/sign_req_model.dart';
import '../services/sign_service.dart';

class SignController extends GetxController {
  SignService signService = SignService();
  AuthController authController = AuthController();

  @override
  void onInit() {
    super.onInit();
    signService = Get.put(SignService());
    authController = Get.find();
  }

  Future<void> signupUser(String name, String email, String pass) async {
    SignReqModel signupReqModel = SignReqModel(name: name, email: email, pass: pass);
    final response = await signService.signup(signupReqModel);
    if (response != null) {
      if (response.status == 0) {
        authController.login(response.message);
      } else if (response.status == 2) {
        Get.defaultDialog(
          middleText: "Email Başkası Tarafından Kullanılmış!",
          textConfirm: "OK",
          onConfirm: () {
            Get.back();
          },
        );
      }
    } else {
      Get.defaultDialog(
        middleText: "Kayıt Hatası!",
        textConfirm: "OK",
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  Future<void> signinUser(String email, String pass) async {
    SignReqModel signinReqModel = SignReqModel(name: '', email: email, pass: pass);
    final response = await signService.signin(signinReqModel);
    if (response != null) {
      if (response.status == 0) {
        authController.login(response.message);
      }
    } else {
      Get.defaultDialog(
        middleText: "Giriş Hatası!",
        textConfirm: "OK",
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  signoutUser() async {
    authController.logOut();
  }
}
