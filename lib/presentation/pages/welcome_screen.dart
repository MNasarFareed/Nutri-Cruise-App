import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_criuse/app/controllers/landing_controller.dart';
import 'package:nutri_criuse/app/controllers/welcome_controller.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  final WelcomeController welController = Get.find();
  final LandingController lanController = Get.find();

  WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(centerTitle: true, title: Text("Nutri Cruise")),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/default_background.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: Animation.fromValueListenable(
                  lanController.textAnimation,
                ),
                child: Text(
                  "Welcome OnBoard!",
                  style: TextStyle(fontSize: 35, fontFamily: 'Common'),
                ),
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: Animation.fromValueListenable(
                      lanController.textAnimation,
                    ),
                    child: Text(
                      "Meet NutriPal",
                      style: TextStyle(fontSize: 20, fontFamily: 'Common'),
                    ),
                  ),

                  ScaleTransition(
                    scale: Animation.fromValueListenable(
                      welController.logoAnimation,
                    ),
                    child: SizedBox(
                      height: 300,
                      width: 190,
                      child: Lottie.asset(
                        fit: BoxFit.cover,
                        'assets/animations/WelcomeAnimation.json',
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 60,
                width: 320,
                child: ScaleTransition(
                  alignment: Alignment.center,
                  scale: Animation.fromValueListenable(
                    lanController.textAnimation,
                  ),
                  child: Text(
                    "Diet giving you a headache? Let’s cook up a plan together",
                    style: TextStyle(fontSize: 20, fontFamily: 'Common'),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
