import 'package:get/get.dart';
import 'package:nutri_criuse/app/bindings/home_binding.dart';
import 'package:nutri_criuse/app/bindings/chatbot_binding.dart';
import 'package:nutri_criuse/app/bindings/form_binding.dart';
import 'package:nutri_criuse/app/bindings/landing_binding.dart';
import 'package:nutri_criuse/app/bindings/welcome_binding.dart';
import 'package:nutri_criuse/presentation/pages/home_screen.dart';
import 'package:nutri_criuse/presentation/pages/welcome_screen.dart';
import 'package:nutri_criuse/presentation/pages/form_screen.dart';
import 'package:nutri_criuse/presentation/pages/chatbot_screen.dart';
import 'package:nutri_criuse/presentation/pages/landing_screen.dart';
import 'package:nutri_criuse/presentation/pages/welcome_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.LANDING;

  static final routes = [
    GetPage(
      name: AppRoutes.LANDING,
      page: () => LandingScreen(),
      binding: LandingBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => WelcomeScreen(),
      binding: WelcomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.CHATBOT,
      page: () => ChatbotScreen(),
      binding: ChatbotBinding(),
    ),
    GetPage(
      name: AppRoutes.FORM,
      page: () => FormScreen(),
      binding: FormBinding(),
    ),
  ];
}
