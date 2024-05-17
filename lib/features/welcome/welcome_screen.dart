import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xo_game/common/button_widget.dart';
import 'package:xo_game/common/custom_app_bar_widget.dart';
import 'package:xo_game/features/welcome/controller/welcome_controller.dart';
import 'package:xo_game/features/welcome/widget/type_name_widget.dart';
import 'package:xo_game/utils/constants/image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WelcomeController());
    return Scaffold(
      appBar: const CustomAppBarWidget(text: 'Welcome to Tic Tac Toe Game'),
      body: GetBuilder<WelcomeController>(builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FadeTransition(
                opacity: controller.imageOpacityAnimation,
                child: Image.asset(logo),
              ),
              FadeTransition(
                opacity: controller.firstButtonAnimation,
                child: ButtonWidget(
                    text: 'Two Player',
                    onPress: () => Get.to(() => const TypeName(
                          isTwoPlayer: true,
                        ))),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeTransition(
                opacity: controller.secondButtonAnimation,
                child: Obx(
                  () => ElevatedButton.icon(
                    onPressed: () {
                      Get.to(() => const TypeName(
                            isTwoPlayer: false,
                          ));
                    },
                    icon: DropdownButton<String>(
                      padding: const EdgeInsets.only(right: 30),
                      value: controller.dropdownValue.value,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? value) {
                        controller.dropdownValue.value = value!;
                      },
                      items: controller.list
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    label: const Text('Play With Computer'),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
