import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/server_controller.dart';

class ServerView extends GetView<ServerController> {
  const ServerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: controller.serverController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Server',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.connect,
              child: const Text('Connect'),
            ),
          ],
        ),
      ),
    );
  }
}
