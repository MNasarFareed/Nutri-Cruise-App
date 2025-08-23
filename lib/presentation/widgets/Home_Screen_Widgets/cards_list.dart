import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nutri_criuse/app/controllers/home_controller.dart';

import 'package:nutri_criuse/app/controllers/intro_controller.dart';
import 'package:nutri_criuse/app/routes/app_routes.dart';
import 'package:nutri_criuse/presentation/widgets/Home_Screen_Widgets/carousel_cards.dart';

List<Widget> getHomeCarouselCards(HomeController controller) {
  return [
    //!Card 1
    _buildTexturedCard(
      CarouselCards(
        onPressed: () {
          print("Navigating to chatbot");
          Get.toNamed(AppRoutes.chatbot);
        },
        controller: controller,
        // sizedBoxHeight: 220,
        // sizedBoxWidth: 230,
        padding: 80,
        asset: 'assets/animations/Chatbot With Character Animation.json',
        text: "Chat With",
        textSize: 30,
        subText: "Your Digital Nutrition",
        subTextSize: 20.0,
        space: 70,
      ),
    ),

    //!Card 2
    _buildTexturedCard(
      Center(
        child: CarouselCards(
          onPressed: () => {},
          controller: controller,
          // sizedBoxHeight: 180,
          // sizedBoxWidth: 300,
          padding: 0,
          asset: 'assets/animations/Nutrition.json',
          text: "Create Your",
          textSize: 30,
          subText: "Diet Plans",
          subTextSize: 15,
          space: 20,
        ),
      ),
    ),

    //! Card 3
    _buildTexturedCard(
      CarouselCards(
        onPressed: () => Get.toNamed(AppRoutes.form),
        controller: controller,
        // sizedBoxHeight: 200,
        // sizedBoxWidth: 240,
        padding: 80,
        asset: 'assets/animations/Diet List.json',
        text: "See Your",
        textSize: 30,
        subText: "Diet Plans",
        subTextSize: 20,
        space: 20,
      ),
    ),
    // !Card 4
    _buildTexturedCard(
      CarouselCards(
        onPressed: () => Get.toNamed(AppRoutes.intro),
        asset: 'assets/animations/WelcomeAnimation.json',
        // sizedBoxHeight: 290,
        // sizedBoxWidth: 240,
        controller: controller,
        padding: 75,
        text: "Meet Nutripal",
        textSize: 30,
        subText: "Your Companion",
        subTextSize: 20.0,
        space: 20,
      ),
    ),
  ];
}

Widget _buildTexturedCard(Widget child) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: const DecorationImage(
        image: AssetImage('assets/images/card_back.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: SingleChildScrollView(child: child),
  );
}
