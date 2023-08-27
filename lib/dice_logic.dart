// create a widget which will generate a new die with a random num
import 'dart:math';
import 'package:flutter/material.dart';

// define a method to get a random number for the dice
int getRandomNumber(){
  final random = Random();
  return random.nextInt(6)+1;
}

// create a controller, which holds the value of the newly generated dice
// it is to be used inside the DiceGenerator
class DiceController extends ChangeNotifier {
  ValueNotifier<int> currentValue = ValueNotifier(getRandomNumber());
  void generateNewDiceValue() {
    currentValue.value = getRandomNumber();
  }
}



// define a dice generator which will create the actul dice on the screen
class DiceGenerator extends StatelessWidget {
  const DiceGenerator({super.key, required this.controller});
  final DiceController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.currentValue,
      builder: (context, diceValue, _) {
        return Container(
          margin: EdgeInsets.all(3),
          width: 55,
          height: 55,
          color: Colors.grey[300],
          child: Center(
            child: Text(
              "$diceValue",
              style: const TextStyle(
                fontFamily: "Caveat",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      });
  }
}