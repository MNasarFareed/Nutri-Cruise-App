import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nutri_criuse/presentation/widgets/Home_Screen_Widgets/carousel_cards.dart';

class HomeController extends GetxController
    with GetTickerProviderStateMixin
    implements CarousalAnimationController {
  late PageController pageController;

  final int itemCount = 4;
  var currentCardIndex = 0.obs;

  late final AnimationController logoController;
  late final AnimationController textController;

  @override
  late final Animation<double> textAnimation;
  @override
  late final Animation<double> logoAnimation;

  @override
  void onInit() {
    super.onInit();

    pageController = PageController();

    textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: textController, curve: Curves.easeOutBack),
    );

    logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: logoController, curve: Curves.decelerate),
    );
  }

  void goToNext(int totalItems) {
    if (currentCardIndex.value < totalItems - 1) {
      currentCardIndex.value++;
      pageController.animateToPage(
        currentCardIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToPrev(int totalItems) {
    if (currentCardIndex.value > 0) {
      currentCardIndex.value--;
      pageController.animateToPage(
        currentCardIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToIndex(int index) {
    if (index >= 0 && index < itemCount) {
      currentCardIndex.value;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    logoController.dispose();
    textController.dispose();
    pageController.dispose();
    super.dispose();
  }
}
