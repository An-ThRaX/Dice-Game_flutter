// define a widget which creates the buttons on the screen
import 'package:flutter/material.dart';

class ButtonTextStylingWidget extends StatelessWidget {
  final String buttonText;

  const ButtonTextStylingWidget({required this.buttonText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonText,
      style: const TextStyle(
        fontFamily: 'Caveat',
        letterSpacing: 1.5,
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
        color: Color.fromARGB(255, 63, 199, 204),
      ),
    );
  }
}

