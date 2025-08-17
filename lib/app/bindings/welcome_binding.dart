import 'package:get/get.dart';
import 'package:nutri_criuse/app/controllers/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }
}
