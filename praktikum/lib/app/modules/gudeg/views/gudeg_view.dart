import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gudeg_controller.dart';

class GudegView extends GetView<GudegController> {
  const GudegView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GudegView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GudegView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
