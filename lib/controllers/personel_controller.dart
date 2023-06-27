import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personel_yonetim/models/personel_req_model.dart';
import 'package:personel_yonetim/services/personel_service.dart';
import '../models/personel_res_model.dart';
import 'auth_controller.dart';

class PersonelController extends GetxController {
  PersonelService personelService = PersonelService();
  AuthController authController = AuthController();

  var isLoading = false.obs;
  List<Message>? personelList;

  @override
  void onInit() {
    super.onInit();
    personelService = Get.put(PersonelService());
    authController = Get.find();
    getPersonels();
  }

  getPersonels() async {
    String? token;
    try {
      isLoading(true);
      if (authController.takeToken() != null) {
        token = authController.takeToken();
      } else {
        token = '';
      }
      final response = await personelService.getPersonels(token!);
      if (response.isNotEmpty) {
        personelList = response;
      } else {
        Get.defaultDialog(
            middleText: "Okuma hatası!",
            textConfirm: "OK",
            onConfirm: () {
              Get.back();
            });
      }
    } catch (e) {
      debugPrint('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> addPersonel(PersonelReqModel personelReqModel) async {
    String? token;
    try {
      isLoading(true);
      if (authController.takeToken() != null) {
        token = authController.takeToken();
      } else {
        token = '';
      }
      final response = await personelService.addPersonel(personelReqModel, token!);
      if (response.status == 0) {
        authController.login(response.message);
      } else if (response.status == 2) {
        Get.defaultDialog(
          middleText: response.message.toString(),
          textConfirm: "OK",
          onConfirm: () {
            Get.back();
          },
        );
      } else if (response.status == 3) {
        Get.defaultDialog(
          middleText: response.message.toString(),
          textConfirm: "OK",
          onConfirm: () {
            Get.back();
          },
        );
      }
    } catch (e) {
      debugPrint('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}
