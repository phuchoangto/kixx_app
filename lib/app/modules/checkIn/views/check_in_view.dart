import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/check_in_controller.dart';

class CheckInView extends GetView<CheckInController> {
  const CheckInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check In View'),
        centerTitle: true,
      ),
      body: MobileScanner(
        controller: controller.camera,
        // fit: BoxFit.contain,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            debugPrint('Barcode found! ${barcode.rawValue}');
            controller.checkIn(barcode.rawValue!);
          }
        },
      ),
    );
  }
}
