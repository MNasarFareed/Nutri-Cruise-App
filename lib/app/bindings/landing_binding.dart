import 'package:get/get.dart';
import 'package:nutri_criuse/app/controllers/landing_controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    print("Landing Binding Called");
    Get.put(LandingController(), permanent: true);
  }
}
