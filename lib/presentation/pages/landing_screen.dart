import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:nutri_criuse/app/controllers/landing_controller.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});
  final LandingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: GetBuilder(
          init: LandingController(),
          builder: (controller) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ScaleTransition(
                  // scale: controller.logoAnimation,
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
                  // ),
                  SizedBox(height: 50),
                  ScaleTransition(
                    scale: controller.textAnimation,
                    child: Text(
                      "Track & Transform",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 2, 12, 87),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Obx(() {
                    print(
                      "Loading Progress : ${controller.loadingProgress.value}",
                    );
                    return Container(
                      height: 20,
                      width: 300,
                      child: LiquidLinearProgressIndicator(
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
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
