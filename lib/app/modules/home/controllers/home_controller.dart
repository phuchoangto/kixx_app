import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../event/event_model.dart';
import '../../event/providers/event_provider.dart';

class HomeController extends GetxController {
  List<Event> events = [];
  var isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    events = await Get.find<EventProvider>().getEvents();
    isLoading.value = false;
  }

  void logout() {
    GetStorage().remove('user');
    Get.offAllNamed('/login');
  }
}
