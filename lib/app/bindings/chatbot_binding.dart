import 'package:get/get.dart';
import 'package:nutri_criuse/app/controllers/chatbot_controller.dart';

class ChatbotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatbotController>(() => ChatbotController());
  }
}
