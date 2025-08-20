import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:nutri_criuse/app/controllers/landing_controller.dart';

class LandingScreen extends StatelessWidget {
  LandingController controller = Get.find();
  LandingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/intro_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200),

                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ScaleTransition(
                  scale: controller.textAnimation,
                  child: Text(
                    "Track, Transform & Thrive",
                    style: TextStyle(
                      fontFamily: 'Common',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 17, 143),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Obx(() {
                    return LiquidLinearProgressIndicator(
                      value: controller.loadingProgress.value,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        controller.progressColor.value,
                      ),
                      backgroundColor: Colors.white,
                      borderColor: const Color.fromARGB(255, 1, 14, 86),
                      direction: Axis.horizontal,
                      borderRadius: 12.0,
                      borderWidth: 2.0,
                      center: Text(
                        controller.loadingText.value,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 50), // Some padding at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
