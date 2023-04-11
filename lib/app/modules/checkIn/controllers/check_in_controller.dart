import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../event/providers/event_provider.dart';

class CheckInController extends GetxController {
  var eventId = Get.arguments;

  MobileScannerController camera = MobileScannerController(
    torchEnabled: false,
  );

  void checkIn(String studentId) async {
    print(studentId.toString());
    camera.stop();
    EasyLoading.show(status: 'loading...');
    final response =
        await Get.find<EventProvider>().checkIn(eventId.toString(), studentId);
    print(response.body);
    if (response.statusCode == 200) {
      EasyLoading.showSuccess('Check-in successfully!');
    } else {
      EasyLoading.showError('Check-in failed, please try again!');
    }
    camera.start();
  }
}
