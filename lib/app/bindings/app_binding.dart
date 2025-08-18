import 'package:get/get.dart';
import 'package:nutri_criuse/app/controllers/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
  }
}
