import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xo_game/common/button_widget.dart';
import 'package:xo_game/features/board/board_screen.dart';
import 'package:xo_game/features/board/controller/board_controller.dart';
import 'package:xo_game/features/welcome/widget/text_field_widget.dart';

class TypeName extends StatelessWidget {
  final bool isTwoPlayer;
  const TypeName({super.key, required this.isTwoPlayer});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BoardController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: controller.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    controller: controller.oPlayer,
                    text: 'O Player Name',
                  ),
                  const SizedBox(height: 10),
                  !isTwoPlayer
                      ? const SizedBox()
                      : TextFieldWidget(
                          controller: controller.xPlayer,
                          text: 'X Player Name',
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    text: 'Submit',
                    onPress: () => controller.formState.currentState!.validate()
                        ? Get.to(() => BoardScreen(isTwoPlayer: isTwoPlayer))
                        : null,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
