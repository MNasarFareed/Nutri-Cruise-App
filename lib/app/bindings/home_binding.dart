import 'package:get/get.dart';
import 'package:nutri_criuse/app/controllers/home_controller.dart';
import 'package:nutri_criuse/app/controllers/intro_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
