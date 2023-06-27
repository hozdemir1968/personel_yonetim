import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personel_yonetim/controllers/personel_controller.dart';
import 'package:personel_yonetim/views/personels/personel_add_page.dart';

import '../../controllers/auth_controller.dart';

class PersonelListPage extends StatelessWidget {
  const PersonelListPage({super.key});
  static const String routeName = '/views/personels/personelList';

  @override
  Widget build(BuildContext context) {
    PersonelController personelController = Get.put(PersonelController());
    AuthController authController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personel Listesi'),
      ),
      body: Obx(
        () => personelController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : personelController.personelList != null
                ? ListView.builder(
                    itemCount: personelController.personelList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            Text(personelController.personelList?[index].name ?? ''),
                            const Text(' '),
                            Text(personelController.personelList?[index].surname ?? '')
                          ],
                        ),
                        subtitle: Text(
                            personelController.personelList?[index].department ?? ''),
                      );
                    },
                  )
                : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(PersonelAddPage.routeName);
        },
        child: const Text('Ekle'),
      ),
    );
  }
}
