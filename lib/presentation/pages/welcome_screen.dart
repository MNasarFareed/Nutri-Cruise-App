import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_criuse/app/controllers/welcome_controller.dart';
import 'package:nutri_criuse/presentation/widgets/Welcome_Screen_Widgets/cards_list.dart';

class WelcomeScreen extends StatelessWidget {
  final WelcomeController welController = Get.find();
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> carousalcards = getWelcomeCarouselCards(welController);
    return Scaffold(
      // appBar: AppBar(centerTitle: true, title: Text("Nutri Cruise")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/default_background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ScaleTransition(
                  scale: Animation.fromValueListenable(
                    welController.textAnimation,
                  ),
                  child: const Text(
                    "Welcome OnBoard!",
                    style: TextStyle(fontSize: 35, fontFamily: 'Common'),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 550,
                      child: CarouselView(
                        controller: welController.carouselController,
                        backgroundColor: const Color.fromARGB(
                          255,
                          115,
                          208,
                          155,
                        ),
                        itemExtent: 380,
                        shrinkExtent: 380,
                        elevation: 8,
                        scrollDirection: Axis.horizontal,
                        children: carousalcards,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Visibility(
                              visible: welController.currentCardIndex.value > 0,
                              maintainState: true,
                              maintainAnimation: true,
                              maintainSize: true,
                              child: SizedBox(
                                width: 130,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 10,
                                    backgroundColor: Colors.blueAccent,
                                  ),
                                  onPressed: () {
                                    welController.goToPrev(
                                      welController.currentCardIndex.value,
                                    );
                                  },
                                  child: Text(
                                    "Previous",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Common',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            (welController.currentCardIndex.value ==
                                    carousalcards.length - 1)
                                //! To controll widget's visibility
                                ? SizedBox(
                                    width: 130,
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 10,
                                        backgroundColor: Colors.blueAccent,
                                      ),
                                      onPressed: () {
                                        Get.offAllNamed('/home');
                                      },
                                      child: Text(
                                        "Continue",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Common',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    width: 130,
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 10,
                                        backgroundColor: Colors.blueAccent,
                                      ),
                                      onPressed: () {
                                        welController.goToNext(
                                          welController.itemCount,
                                        );
                                      },
                                      child: Text(
                                        "Next",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Common',
                                          color: const Color.fromARGB(
                                            255,
                                            255,
                                            255,
                                            255,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
