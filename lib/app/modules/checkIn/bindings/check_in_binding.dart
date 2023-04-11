import 'package:get/get.dart';

import '../controllers/check_in_controller.dart';
import '../../event/providers/event_provider.dart';

class CheckInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckInController>(
      () => CheckInController(),
    );
    Get.lazyPut<EventProvider>(
      () => EventProvider(),
    );
  }
}
