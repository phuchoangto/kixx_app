import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';

import '../providers/server_provider.dart';

class ServerController extends GetxController {
  TextEditingController serverController = TextEditingController();

  void connect() async {
    EasyLoading.show(status: 'loading...');
    try {
      final response =
          await Get.find<ServerProvider>().connect(serverController.text);
      if (response.statusCode == 200) {
        var success = response.body['success'];
        if (success) {
          EasyLoading.showSuccess('Connected successfully!');
          GetStorage().write('server', serverController.text);
          Get.offNamed('/login');
        } else {
          EasyLoading.showError('Connected failed, please try again!');
        }
      } else {
        EasyLoading.showError('Connected failed, please try again!');
      }
    } catch (e) {
      EasyLoading.showError('Connected failed, please try again!');
    }
  }
}
