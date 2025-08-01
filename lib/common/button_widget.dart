import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPress;
  final String text;
  const ButtonWidget({super.key, this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(50, 50),
      ),
      child: Text(text),
    );
  }
}
