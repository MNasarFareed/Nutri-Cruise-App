import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  var isFirstTime = true.obs;

  @override
  void inInit() {
    super.onInit();
    checkFirstTime();
  }

  Future<void> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? seen = prefs.getBool('has_seen_welcome');
    if (seen == null) {
      if (seen = false) {
        isFirstTime.value = true;
      }
    } else {
      isFirstTime.value = false;
      Get.offNamed("/home");
    }
  }

  Future<void> markWelcomeAsSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_welcome', true);
    isFirstTime.value = false;
  }
}
