import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personel_yonetim/views/home_page.dart';
import 'package:personel_yonetim/views/personels/personel_list_page.dart';
import 'package:personel_yonetim/views/auth/auth_splash.dart';
import '../controllers/sign_controller.dart';
import '../controllers/theme_controller.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu({super.key});
  final signupController = Get.put(SignController());
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MENU"),
        centerTitle: true,
      ),
      body: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("Ana Sayfa"),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.toNamed(HomePage.routeName);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.list),
                    title: const Text("Personel Listesi"),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.back();
                      Get.toNamed(PersonelListPage.routeName);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_location_alt_outlined),
                    title: const Text("............"),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.toNamed(HomePage.routeName);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.mode),
                    title: const Text('Aydınlık/Karanlık'),
                    trailing: Obx(
                      () => Switch(
                        value: themeController.isDarkMode.value,
                        onChanged: (value) {
                          themeController.toggleTheme();
                        },
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Çıkış Yap"),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () async {
                      await signupController.signoutUser();
                      Get.offAllNamed(AuthSplash.routeName);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
