import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:lottie/lottie.dart';

abstract class CarousalAnimationController {
  Animation<double> get logoAnimation;
  Animation<double> get textAnimation;
}

class CarouselCards extends StatelessWidget {
  final Callback onPressed;
  final CarousalAnimationController controller;
  // final double sizedBoxHeight;
  // final double sizedBoxWidth;
  final double padding;
  final String asset;
  final String text;
  final double textSize;
  final String? subText;
  final double? subTextSize;
  final double space;

  CarouselCards({
    super.key,
    required this.onPressed,
    required this.controller,
    // required this.sizedBoxHeight,
    // required this.sizedBoxWidth,
    required this.padding,
    required this.asset,
    required this.text,
    required this.textSize,
    this.subText,
    this.subTextSize,
    required this.space,
  });

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final animationSize = screenWidth * 0.25;

    final respnsiveTextSize = screenWidth * 0.045;
    final respnsiveSubTextSize = screenWidth * 0.035;

    final respnsiveSpace = screenHeight * 0.02;
    final respnsivePadding = screenWidth * 0.03;

    return InkWell(
      onTap: onPressed,
      child: SingleChildScrollView(
        child: Container(
          height: screenWidth * 0.55, //! 55% of screen height
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(respnsivePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: Animation.fromValueListenable(
                      controller.logoAnimation,
                    ),
                    child: Container(
                      height: animationSize,
                      width: animationSize,
                      alignment: Alignment.center,
                      child: Lottie.asset(
                        fit: BoxFit.contain,
                        asset,
                        height: animationSize,
                        width: animationSize,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  SizedBox(height: respnsiveSpace),
                  ScaleTransition(
                    scale: Animation.fromValueListenable(
                      controller.textAnimation,
                    ),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: respnsiveTextSize,
                        fontFamily: 'Common',
                        color: Colors.white,
                      ),
                    ),
                  ),

                  ScaleTransition(
                    scale: Animation.fromValueListenable(
                      controller.textAnimation,
                    ),
                    child: Text(
                      subText.toString(),
                      style: TextStyle(
                        fontSize: respnsiveSubTextSize,
                        fontFamily: 'Common',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
