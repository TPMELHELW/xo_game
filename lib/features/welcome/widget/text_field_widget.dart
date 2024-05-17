import 'package:flutter/material.dart';
import 'package:xo_game/utils/functions/valid_input.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const TextFieldWidget(
      {super.key, required this.controller, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validateEmpty,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        fillColor: const Color.fromARGB(255, 223, 222, 222),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
