import 'package:flutter/material.dart';
import 'package:xo_game/common/button_widget.dart';
import 'package:xo_game/features/board/controller/board_controller.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BoardController.instance;
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Expanded(
            child: ButtonWidget(
              text: 'Reset Game',
              onPress: () => controller.initGame(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: ButtonWidget(
              text: 'Reset Result',
              onPress: () => controller.initResult(),
            ),
          )
        ],
      ),
    );
  }
}
