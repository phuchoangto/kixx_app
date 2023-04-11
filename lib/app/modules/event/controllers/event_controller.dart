import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../event_model.dart';
import '../../login/user_model.dart';

class EventController extends GetxController {
  Event event = Get.arguments;
  var isAdmin = false;

  @override
  void onInit() {
    final user = GetStorage().read('user');
    // user has roles is List<String> check if it contains 'ADMIN'
    if (user != null && user['roles'].contains('ADMIN')) {
      isAdmin = true;
    }
    super.onInit();
  }
}
