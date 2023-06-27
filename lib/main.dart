import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:personel_yonetim/controllers/theme_controller.dart';
import 'package:personel_yonetim/routing/get_pages.dart';
import 'themes/themes.dart';
import 'views/auth/auth_splash.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personel Yönetimi',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeController.theme,
      getPages: getPages,
      home: AuthSplash(),
    );
  }
}
