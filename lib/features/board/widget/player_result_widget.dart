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
                Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.isOturn.value
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                    child: Text(controller.oPlayer.text)),
                Text(
                  '${controller.oPlayerScore.value}',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: const Text('Draw')),
                Text(
                  '${controller.draw.value}',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: !controller.isOturn.value
                        ? Colors.red
                        : Colors.transparent,
                  ),
                  child: Text(controller.xPlayer.text == ''
                      ? 'Computer'
                      : controller.xPlayer.text),
                ),
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
