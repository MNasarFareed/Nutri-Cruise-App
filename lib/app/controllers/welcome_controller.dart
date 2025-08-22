import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nutri_criuse/presentation/widgets/Welcome_Screen_Widgets/carousel_cards.dart';

class WelcomeController extends GetxController
    with GetTickerProviderStateMixin
    implements CarousalAnimationController {
  late CarouselController carouselController;

  int itemCount = 4;
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

    carouselController = CarouselController();

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

  Future<void> goToIndex(int index) async {
    await carouselController.animateToItem(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    currentCardIndex.value = index;
  }

  Future<void> goToNext(int itemCount) =>
      goToIndex((currentCardIndex.value + 1).clamp(0, itemCount - 1));
  Future<void> goToPrev(int itemCount) =>
      goToIndex((currentCardIndex.value - 1).clamp(0, itemCount - 1));

  @override
  void dispose() {
    logoController.dispose();
    textController.dispose();
    carouselController.dispose();
    super.dispose();
  }
}
