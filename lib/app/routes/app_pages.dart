import 'package:get/get.dart';
import 'package:nutri_criuse/app/bindings/home_binding.dart';
import 'package:nutri_criuse/app/bindings/chatbot_binding.dart';
import 'package:nutri_criuse/app/bindings/form_binding.dart';
import 'package:nutri_criuse/app/bindings/landing_binding.dart';
import 'package:nutri_criuse/app/bindings/intro_binding.dart';
import 'package:nutri_criuse/presentation/pages/home_screen.dart';
import 'package:nutri_criuse/presentation/pages/Intro_screen.dart';
import 'package:nutri_criuse/presentation/pages/form_screen.dart';
import 'package:nutri_criuse/presentation/pages/chatbot_screen.dart';
import 'package:nutri_criuse/presentation/pages/landing_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.landing;

  static final routes = [
    GetPage(
      name: AppRoutes.landing,
      page: () => LandingScreen(),
      binding: LandingBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.intro,
      page: () => IntroScreen(),
      binding: IntroBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.chatbot,
      page: () => ChatbotScreen(),
      binding: ChatbotBinding(),
    ),
    GetPage(
      name: AppRoutes.form,
      page: () => FormScreen(),
      binding: FormBinding(),
    ),
  ];
}
