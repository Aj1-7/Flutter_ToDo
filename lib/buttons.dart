import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  MyButton({
    Key? key,
    required this.text,
    required this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.cyan,
      child: Text(text),
    );
  }
}
