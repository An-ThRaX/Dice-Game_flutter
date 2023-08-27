// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'create_logo.dart';
import 'custom_app_bar.dart';
import 'dice_logic.dart';
import 'create_buttons.dart';

void main() => runApp(MaterialApp(
  home: DiceGame(),
));

class DiceGame extends StatefulWidget {
  const DiceGame({super.key});

  @override
  State<DiceGame> createState() => _DiceGameState();
}

/// Better ... this is how flutter optimizes the build process
/// As child for another widget,
/// the _IncreaseNumberOfDieWidget is not always recreated even if the build method is called

// create a widget which adds a new dice on the screen
class _IncreaseNumberOfDieWidget extends StatelessWidget {
  const _IncreaseNumberOfDieWidget({
    this.increaseNumberOfDie,
    Key? key,
  }) : super(key: key);

  final VoidCallback? increaseNumberOfDie;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[700],
        shape: StadiumBorder(),
      ),
      onPressed: () {
        increaseNumberOfDie?.call();
      },
      // use a widget for the buttons styling
      child: ButtonTextStylingWidget(buttonText: "Add a die!"),
    );
  }
}


class _DiceGameState extends State<DiceGame> {
  // create a list of DiceControllers in which the values are stored
  List<DiceController> diceControllers = [];

  int dieCount = 0;
  
  int calculateTotalSum(){
    int totalSum = 0;
    for (final controller in diceControllers){
      totalSum += controller.currentValue.value;
    }
    return totalSum;
  }

  void increaseNumberOfControllers() {
    setState(() {
      diceControllers.add(DiceController());
      dieCount++;
    });
  }

  void decreaseNumberOfControllers() {
    ///
    if (dieCount > 0) {
      setState(() {
        diceControllers.removeLast();
        dieCount--;
      });
    }
  }

  void rollDice() {
    for (final controller in diceControllers) {
      controller.generateNewDiceValue();
    }
    /// maybe use postframecallback so that dicecontrollerß udpate their "state" and then you can sum
  }

  /// should have the same as the other one
// create a widget to remove a dice
  Widget _decreaseNumberOfDieWidget() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[700],
        shape: StadiumBorder(),
      ),
      onPressed: decreaseNumberOfControllers,
      // use a widget for the buttons styling
      child: ButtonTextStylingWidget(buttonText: "Remove a die!"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // import the widget from utils
      appBar: CustomAppBar(), 
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // use a predifined widget for the logo
            AddLogoWidget(),
            // creates the line under the thumb picture
            Divider(
              height: 60.0, // is the height above and under the line
              color: Colors.grey[800],
            ),
            Row(
              // main top row which will hold the two rows which have the buttons
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  // first row which will hold "Roll the dice" and the sum
                  children: [
                    ElevatedButton(
                      onPressed: rollDice,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[700],
                        shape: StadiumBorder(),
                      ),
                      child: ButtonTextStylingWidget(buttonText: "Roll the dice!"),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Builder(
                      builder: (BuildContext context) {
                        return Text(
                          "this is dice sum: ${calculateTotalSum()} ",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 63, 199, 204),
                          ),
                        );
                      }
                    ),
                  ],
                ),
                Row(
                  // second row which holds the widgets for "Add a die", total num of die
                  // and the "Remove a die"
                  children: [
                    // call the widget which builds the button to add die
                    _IncreaseNumberOfDieWidget(
                      increaseNumberOfDie: () {
                        setState(() {
                          increaseNumberOfControllers();
                        });
                      },
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    // add a text with the count of die
                    Text(
                      "Total number of die on table: $dieCount",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 63, 199, 204),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    // call the widget which builds the buttom to remove die
                    _decreaseNumberOfDieWidget(),
                  ],
                ),
              ],
            ),
            Divider(
              // creates the line under the thumb picture
              height: 60.0, // is the height above and under the line
              color: Colors.grey[800],
            ),
            Row(
                // here should be all the widgets which spawn a dice and it's num
                children: <Widget>[
                  ...diceControllers.map(
                      (controller) => DiceGenerator(controller: controller))
                ]),
          ],
        ),
      ),
    );
  }
}




