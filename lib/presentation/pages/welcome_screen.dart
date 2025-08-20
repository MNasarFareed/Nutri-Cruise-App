import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_criuse/app/controllers/landing_controller.dart';
import 'package:nutri_criuse/app/controllers/welcome_controller.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  final WelcomeController welController = Get.find();

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
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScaleTransition(
                      scale: Animation.fromValueListenable(
                        welController.textAnimation,
                      ),
                      child: Text(
                        "Welcome OnBoard!",
                        style: TextStyle(fontSize: 35, fontFamily: 'Common'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                SizedBox(
                  height: 500,
                  child: CarouselView(
                    backgroundColor: const Color.fromARGB(255, 115, 208, 155),
                    itemExtent: 320,
                    shrinkExtent: 220,
                    elevation: 5,
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildTexturedCard(
                        //!Card 1
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ScaleTransition(
                                  scale: Animation.fromValueListenable(
                                    welController.textAnimation,
                                  ),
                                  child: Text(
                                    "Meet NutriPal",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Common',
                                    ),
                                  ),
                                ),

                                ScaleTransition(
                                  scale: Animation.fromValueListenable(
                                    welController.logoAnimation,
                                  ),
                                  child: SizedBox(
                                    height: 300,
                                    width: 240,
                                    child: Lottie.asset(
                                      fit: BoxFit.cover,
                                      'assets/animations/WelcomeAnimation.json',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //! Card 2
                      _buildTexturedCard(
                        Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ScaleTransition(
                                  scale: Animation.fromValueListenable(
                                    welController.logoAnimation,
                                  ),
                                  child: SizedBox(
                                    height: 200,
                                    width: 240,
                                    child: Lottie.asset(
                                      fit: BoxFit.cover,
                                      'assets/animations/Diet List.json',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(50.0),
                                  child: ScaleTransition(
                                    alignment: Alignment.center,
                                    scale: Animation.fromValueListenable(
                                      welController.textAnimation,
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Welcome to NutriCruise, your personal companion for smarter and healthier eating. From tracking your meals to creating personalized diet plans, we make nutrition simple and engaging. Let’s cruise together toward a balanced lifestyle that fuels your body and mind.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Common',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //!Card 3
                      _buildTexturedCard(
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsetsGeometry.only(top: 100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ScaleTransition(
                                  scale: Animation.fromValueListenable(
                                    welController.textAnimation,
                                  ),
                                  child: Text(
                                    "Meet NutriPal",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Common',
                                    ),
                                  ),
                                ),
                            
                                ScaleTransition(
                                  scale: Animation.fromValueListenable(
                                    welController.logoAnimation,
                                  ),
                                  child: SizedBox(
                                    height: 300,
                                    width: 240,
                                    child: Lottie.asset(
                                      fit: BoxFit.cover,
                                      'assets/animations/WelcomeAnimation.json',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //!Card 4
                      _buildTexturedCard(
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ScaleTransition(
                                  scale: Animation.fromValueListenable(
                                    welController.textAnimation,
                                  ),
                                  child: Text(
                                    "Meet NutriPal",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Common',
                                    ),
                                  ),
                                ),
                            
                                ScaleTransition(
                                  scale: Animation.fromValueListenable(
                                    welController.logoAnimation,
                                  ),
                                  child: SizedBox(
                                    height: 300,
                                    width: 240,
                                    child: Lottie.asset(
                                      fit: BoxFit.cover,
                                      'assets/animations/WelcomeAnimation.json',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
    child: child,
  );
}
