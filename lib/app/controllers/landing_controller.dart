import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LandingController extends GetxController
    with GetTickerProviderStateMixin {
  // late AnimationController logoController;
  // late Animation<double> logoAnimation;

  late AnimationController textController;
  late Animation<double> textAnimation;

  // late AnimationController progressController;

  var loadingProgress = 0.0.obs;
  var loadingText = "Initializing...".obs;
  var progressColor = Colors.red.obs;

  void updateProgress(double value) {
    loadingProgress.value = value;

    if (value <= 0.2) {
      progressColor.value = Colors.red;
    } else if (value <= 0.4) {
      progressColor.value = Colors.orange;
    } else if (value <= 0.6) {
      progressColor.value = Colors.yellow;
    } else if (value <= 0.8) {
      progressColor.value = Colors.lime;
    } else {
      progressColor.value = Colors.green;
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: textController, curve: Curves.easeOutBack),
    );
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    loadingText.value = "Connecting to server....";
    updateProgress(0.1);
    await Future.delayed(Duration(seconds: 1));

    loadingText.value = "Preparing AI assistant....";
    updateProgress(0.5);
    await Future.delayed(Duration(seconds: 1));

    loadingText.value = "Resolving Dependencies";
    updateProgress(0.8);
    await Future.delayed(Duration(seconds: 1));

    loadingText.value = "Ready to Cruise....";
    updateProgress(1.2);
    await Future.delayed(Duration(seconds: 1));

    Get.offNamed('/home');
  }

  @override
  void onClose() {
    // logoController.dispose();
    textController.dispose();
    // progressController.dispose();
    super.onClose();
  }
}
