import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xo_game/common/custom_app_bar_widget.dart';
import 'package:xo_game/features/board/controller/board_controller.dart';
import 'package:xo_game/features/board/widget/board_widget.dart';
import 'package:xo_game/features/board/widget/player_result_widget.dart';
import 'package:xo_game/features/board/widget/setting_button_widget.dart';

class BoardScreen extends StatelessWidget {
  final bool isTwoPlayer;

  const BoardScreen({super.key, required this.isTwoPlayer});

  @override
  Widget build(BuildContext context) {
    Get.put(BoardController());
    return Scaffold(
      appBar: CustomAppBarWidget(
          text: isTwoPlayer ? 'Two Player' : 'Have Fun With Computer'),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PlayerResultWidget(),
            BoardWidget(
              isTwoPlayer: isTwoPlayer,
            ),
            const SettingButtonWidget()
          ],
        ),
      ),
    );
  }
}
