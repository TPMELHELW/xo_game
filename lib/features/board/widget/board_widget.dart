import 'package:flutter/material.dart';
import 'package:get/get.dart' show Obx;
import 'package:xo_game/features/board/controller/board_controller.dart';

class BoardWidget extends StatelessWidget {
  final bool isTwoPlayer;
  const BoardWidget({super.key, required this.isTwoPlayer});

  @override
  Widget build(BuildContext context) {
    final controller = BoardController.instance;
    return Expanded(
      flex: 3,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
          ),
          padding: const EdgeInsets.all(5),
          itemCount: 9,
          itemBuilder: (_, index) {
            return Obx(
              () => GestureDetector(
                onTap: () {
                  if (isTwoPlayer) {
                    !controller.isEnd.value
                        ? controller.twoPlayerFun(index)
                        : null;
                  } else {
                    controller.isEnd.value ? null : controller.selectFun(index);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: controller.options[index].isEmpty
                        ? Colors.grey
                        : controller.options[index] == 'X'
                            ? Colors.red
                            : Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      controller.options[index],
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
