import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xo_game/features/welcome/controller/welcome_controller.dart';
import 'package:xo_game/utils/functions/snack_bar.dart';

class BoardController extends GetxController {
  static BoardController get instance => Get.find<BoardController>();

  ///variable
  late Rx<bool> isOturn, isEnd;
  late RxList<String> options;
  late Rx<int> xPlayerScore, oPlayerScore;
  final welcomeController = WelcomeController.instance;

  List<List<int>> winning = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ];

  ///Reset Game fun
  void initGame() {
    options.value = ['', '', '', '', '', '', '', '', ''];
    isOturn.value = true;
    isEnd.value = false;
  }

  ///Reset result fun
  void initResult() {
    xPlayerScore.value = 0;
    oPlayerScore.value = 0;
  }

  ///Check winner
  void checkWinner() async {
    for (var winningPosition in winning) {
      if (options[winningPosition[0]].isNotEmpty) {
        if (options[winningPosition[0]] == options[winningPosition[1]] &&
            options[winningPosition[0]] == options[winningPosition[2]]) {
          isEnd.value = true;
          !isOturn.value ? oPlayerScore.value++ : xPlayerScore.value++;
          showSnackBar('Congratulation', '${options[winningPosition[0]]} Win',
              options[winningPosition[0]] == 'X' ? Colors.red : Colors.blue);
          await Future.delayed(const Duration(milliseconds: 500));
          initGame();
          return;
        }
      }
    }

    checkTieFun();
  }

  ///Check Tie Fun
  void checkTieFun() {
    options.contains('')
        ? null
        : {showSnackBar('Draw', 'No Win', Colors.white)};
  }

  ///Two Player Fun
  void twoPlayerFun(int index) {
    if (isOturn.value && options[index] == '') {
      options[index] = 'O';
      isOturn.value = !isOturn.value;
      checkWinner();
      // checkTieFun();
    } else if (!isOturn.value && options[index] == '') {
      options[index] = 'X';
      isOturn.value = !isOturn.value;
      checkWinner();
      // checkTieFun();
    }
  }

  ///Select Computer fun
  void selectFun(int index, {bool isComputerMove = false}) {
    if (options[index] == '') {
      options[index] = isOturn.value ? 'O' : 'X';
      isOturn.value = !isOturn.value;
      checkWinner();
      if (!isEnd.value && !isComputerMove) {
        welcomeController.dropdownValue.value == 'Easy'
            ? easyComputerMove()
            : hardComputerMove();
      }
      // checkTieFun();
    }
  }

  ///Easy Level
  void easyComputerMove() {
    if (isEnd.value) return;
    var emptyIndices = List<int>.generate(options.length, (i) => i)
        .where((index) => options[index] == '')
        .toList();
    if (emptyIndices.isNotEmpty) {
      final randomIndex = Random().nextInt(emptyIndices.length);
      selectFun(emptyIndices[randomIndex], isComputerMove: true);
    }
  }

  ///Hard Level
  void hardComputerMove() {
    if (isEnd.value) return;

    for (var winningPosition in winning) {
      if (options[winningPosition[0]] == options[winningPosition[1]] &&
          options[winningPosition[2]].isEmpty &&
          options[winningPosition[0]].isNotEmpty) {
        selectFun(winningPosition[2], isComputerMove: true);
        return;
      } else if (options[winningPosition[2]] == options[winningPosition[1]] &&
          options[winningPosition[0]].isEmpty &&
          options[winningPosition[2]].isNotEmpty) {
        selectFun(winningPosition[0], isComputerMove: true);
        return;
      } else if (options[winningPosition[0]] == options[winningPosition[2]] &&
          options[winningPosition[1]].isEmpty &&
          options[winningPosition[2]].isNotEmpty) {
        selectFun(winningPosition[1], isComputerMove: true);
        return;
      }
    }
    if (isEnd.value) return;
    var emptyIndices = List<int>.generate(options.length, (i) => i)
        .where((index) => options[index] == '')
        .toList();
    if (emptyIndices.isNotEmpty) {
      final randomIndex = Random().nextInt(emptyIndices.length);
      selectFun(emptyIndices[randomIndex], isComputerMove: true);
    }
  }

  @override
  void onInit() {
    options = ['', '', '', '', '', '', '', '', ''].obs;
    isOturn = true.obs;
    isEnd = false.obs;
    xPlayerScore = 0.obs;
    oPlayerScore = 0.obs;

    super.onInit();
  }
}
