import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personel_yonetim/controllers/theme_controller.dart';
import 'package:personel_yonetim/views/home_page.dart';
import 'package:personel_yonetim/views/personels/personel_list_page.dart';
import 'package:personel_yonetim/views/auth/auth_splash.dart';
import '../controllers/sign_controller.dart';
import '../themes/themes.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final signupController = Get.find<SignController>();
  final themeController = Get.find<ThemeController>();

  void signoutUser() async {
    await signupController.signoutUser();
  }

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
                    trailing: Switch(
                      value: Get.isDarkMode,
                      onChanged: (value) {
                        if (value) {
                          themeController.changeTheme(Themes.lightTheme);
                          themeController.saveTheme(false);
                        } else {
                          themeController.changeTheme(Themes.darkTheme);
                          themeController.saveTheme(true);
                        }
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Çıkış Yap"),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      signoutUser();
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
