import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../providers/auth_provider.dart';
import '../user_model.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
  }

  void login() async {
    try {
      final user = await Get.find<AuthProvider>().login(
        usernameController.text,
        passwordController.text,
      );
      GetStorage().write('user', user.toJson());
      Get.offNamed('/home');
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Username or password is incorrect',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
