import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeController extends GetxController
    with GetTickerProviderStateMixin {
  late final AnimationController logoController;
  late final Animation<double> logoAnimation;

  @override
  void onInit() {
    super.onInit();

    logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..fling();

    logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: logoController, curve: Curves.decelerate),
    );
  }

  @override
  void dispose() {
    logoController.dispose();
  }
}
