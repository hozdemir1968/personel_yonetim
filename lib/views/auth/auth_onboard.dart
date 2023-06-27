import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signin_page.dart';
import '../home_page.dart';
import '../../controllers/auth_controller.dart';

class AuthOnBoard extends StatelessWidget {
  const AuthOnBoard({Key? key}) : super(key: key);
  static const String routeName = '/views/auth/authOnboard';

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();

    return Obx(() {
      return authController.isLogged.value ? const HomePage() : const SigninPage();
    });
  }
}
