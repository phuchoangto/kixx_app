import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';

import '../controllers/event_controller.dart';

class EventView extends GetView<EventController> {
  const EventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventView'),
        centerTitle: true,
        // qr scan action
        actions: controller.isAdmin
            ? [
                IconButton(
                  onPressed: () =>
                      Get.toNamed('/check-in', arguments: controller.event.id),
                  icon: const Icon(Icons.qr_code_scanner),
                ),
              ]
            : [],
      ),
      body: SingleChildScrollView(
        // wrap with SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                controller.event.imageUrl ?? '',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  controller.event.name ?? '',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Html(
                data: controller.event.description ?? '',
                style: {
                  'html': Style(fontSize: const FontSize(16)),
                  'p': Style(margin: const EdgeInsets.symmetric(vertical: 5)),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
