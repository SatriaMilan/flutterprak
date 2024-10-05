import 'package:get/get.dart';

import '../controllers/gudeg_controller.dart';

class GudegBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GudegController>(
      () => GudegController(),
    );
  }
}
