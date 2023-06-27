import 'auth_cache_manager.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with AuthCacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }

  String? takeToken() {
    final token = getToken();
    return token;
  }
}
