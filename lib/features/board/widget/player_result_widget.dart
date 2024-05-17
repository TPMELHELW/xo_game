import 'package:flutter/material.dart';
import 'package:get/get.dart' show Obx;
import 'package:xo_game/features/board/controller/board_controller.dart';

class PlayerResultWidget extends StatelessWidget {
  const PlayerResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BoardController.instance;
    return Expanded(
      flex: 1,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text('O result'),
                Text(
                  '${controller.oPlayerScore.value}',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
            Column(
              children: [
                const Text('X result'),
                Text(
                  '${controller.xPlayerScore.value}',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
