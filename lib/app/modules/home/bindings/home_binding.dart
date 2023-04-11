import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../event/providers/event_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<EventProvider>(
      () => EventProvider(),
    );
  }
}
