import 'package:get/get.dart';

import '../controllers/server_controller.dart';
import '../providers/server_provider.dart';

class ServerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServerController>(
      () => ServerController(),
    );
    Get.lazyPut<ServerProvider>(
      () => ServerProvider(),
    );
  }
}
