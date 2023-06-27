import 'package:get/get.dart';
import 'get_bindings.dart';
import '../views/auth/signin_page.dart';
import '../views/home_page.dart';
import '../views/personels/personel_add_page.dart';
import '../views/personels/personel_list_page.dart';
import '../views/auth/auth_splash.dart';
import '../views/auth/signup_page.dart';

List<GetPage> getPages = [
  GetPage(
    name: AuthSplash.routeName,
    page: () => AuthSplash(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: SigninPage.routeName,
    page: () => const SigninPage(),
    binding: SignBinding(),
  ),
  GetPage(
    name: SignupPage.routeName,
    page: () => const SignupPage(),
    binding: SignBinding(),
  ),
  GetPage(
    name: HomePage.routeName,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: PersonelListPage.routeName,
    page: () => const PersonelListPage(),
    binding: PersonelBinding(),
  ),
  GetPage(
    name: PersonelAddPage.routeName,
    page: () => const PersonelAddPage(),
    binding: PersonelBinding(),
  ),
];
