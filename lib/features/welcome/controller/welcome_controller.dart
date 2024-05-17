import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xo_game/utils/constants/image.dart';

class WelcomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static WelcomeController get instance => Get.find();

  late AnimationController animationController;
  late Animation<double> imageOpacityAnimation;
  late Animation<double> firstButtonAnimation;
  late Animation<double> secondButtonAnimation;
  late RxList<String> list;
  late RxString dropdownValue;

  @override
  void onInit() {
    list = <String>['Easy', 'Hard'].obs;
    dropdownValue = list.first.obs;
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage(logo), Get.context!).then((_) {
        animationController.forward();
      });
    });

    imageOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.3,
          curve: Curves.easeIn,
        ),
      ),
    );

    firstButtonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.3,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );

    secondButtonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.7,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
