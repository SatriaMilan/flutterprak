import 'package:get/get.dart';
import 'package:myapp/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2872239552.
  Future<void> moveToResep() async {
  Get.toNamed(Routes.RESEP);
}
}
