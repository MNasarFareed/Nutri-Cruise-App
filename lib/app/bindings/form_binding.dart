import 'package:get/get.dart';
import 'package:nutri_criuse/app/controllers/form_controller.dart';

class FormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormController>(() => FormController());
  }
}
