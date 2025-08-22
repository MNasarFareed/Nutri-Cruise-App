import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:lottie/lottie.dart';

abstract class CarousalAnimationController {
  Animation<double> get logoAnimation;
  Animation<double> get textAnimation;
}

class CarouselCards extends StatelessWidget {
  final Callback onPressed;
  final CarousalAnimationController controller;
  final double sizedBoxHeight;
  final double sizedBoxWidth;
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
    required this.sizedBoxHeight,
    required this.sizedBoxWidth,
    required this.padding,
    required this.asset,
    required this.text,
    required this.textSize,
    this.subText,
    this.subTextSize,
    required this.space,
  });

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: Animation.fromValueListenable(controller.logoAnimation),
                child: SizedBox(
                  height: sizedBoxHeight,
                  width: sizedBoxWidth,
                  child: Lottie.asset(fit: BoxFit.cover, asset),
                ),
              ),
              SizedBox(height: space),
              ScaleTransition(
                scale: Animation.fromValueListenable(controller.textAnimation),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: textSize,
                    fontFamily: 'Common',
                    color: Colors.white,
                  ),
                ),
              ),
              (subText != null)
                  ? ScaleTransition(
                      scale: Animation.fromValueListenable(
                        controller.textAnimation,
                      ),
                      child: Text(
                        subText.toString(),
                        style: TextStyle(
                          fontSize: subTextSize,
                          fontFamily: 'Common',
                          color: Colors.white,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
