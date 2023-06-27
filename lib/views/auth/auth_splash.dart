import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import 'auth_onboard.dart';

class AuthSplash extends StatelessWidget {
  AuthSplash({super.key});
  static const String routeName = '/views/auth/authSplash';

  final AuthController authController = Get.put(AuthController());

  Future<void> initializeSettings() async {
    authController.checkLoginStatus();
    await Future.delayed(const Duration(microseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else if (snapshot.hasError) {
          return errorView(snapshot);
        } else {
          return const AuthOnBoard();
        }
      },
    );
  }

  Scaffold waitingView() {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(
      body: Center(
        child: Text('Error: ${snapshot.error}'),
      ),
    );
  }
}
