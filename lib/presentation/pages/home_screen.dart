import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_criuse/app/controllers/home_controller.dart';
import 'package:nutri_criuse/presentation/widgets/Home_Screen_Widgets/cards_list.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.find();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> carousalcards = getHomeCarouselCards(controller);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2, //! 20% of screen height
                child: ScaleTransition(
                  scale: Animation.fromValueListenable(
                    controller.textAnimation,
                  ),
                  child: Text(
                    "Welcome OnBoard!",
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      fontFamily: 'Common',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6, //! 60% of the screen
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (index) =>
                      controller.currentCardIndex.value = index,
                  scrollDirection: Axis.horizontal,
                  itemCount: carousalcards.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: carousalcards[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1,
                    vertical: screenHeight * 0.02,
                  ),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //! To controll widget's visibility
                        Visibility(
                          visible: controller.currentCardIndex.value > 0,
                          maintainState: true,
                          maintainAnimation: true,
                          maintainSize: true,
                          child: SizedBox(
                            width: screenWidth * 0.30,
                            height: screenHeight * 0.06,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 8,
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                controller.goToPrev(4);
                              },
                              child: Text(
                                "Previous",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontFamily: 'Common',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Row(
                          children: List.generate(
                            controller.itemCount,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    controller.currentCardIndex.value == index
                                    ? Colors.blueAccent
                                    : Colors.grey.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible:
                              controller.currentCardIndex.value < 3,
                          child: SizedBox(
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.06,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 8,
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                controller.goToNext(4);
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
