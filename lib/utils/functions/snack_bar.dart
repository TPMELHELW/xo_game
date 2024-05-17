// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController showSnackBar(String title, String body, Color color) {
  return Get.snackbar(
    title,
    body,
    backgroundColor: color,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(10),
  );
}
