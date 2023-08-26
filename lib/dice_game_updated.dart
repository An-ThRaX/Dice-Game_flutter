// ignore_for_file: prefer_const_constructors

import 'package:the_die_game/utils.dart';
import 'package:flutter/material.dart';

/// UPDATED HERE
// void main() => runApp(MaterialApp(
//   home: DiceGame(),
// ));

class DiceGame extends StatefulWidget {
  const DiceGame({super.key});

  @override
  State<DiceGame> createState() => _DiceGameState();
}

// create a widget which will generate a new die with a random num
class DiceGenerator extends StatelessWidget {
  /// UPDATED HERE
  const DiceGenerator({super.key, required this.controller});
  final DiceController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller.currentValue,
        builder: (context, rollValue, _) {
          return Container(
            width: 55,
            height: 55,
            color: Colors.grey[300],
            child: Center(
              child: Text(
                "$rollValue",
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

class _DiceGameState extends State<DiceGame> {
  /// UPDATED HERE
  /// In this case it is not needed to "store" the widgets
  ///
  // List <Widget> diceWidgets = []; // Store the dice widgets

  /// store the logic, not the UI (less expensive)

  List<DiceController> diceControllers = [];

  int dieCount = 0;
  int sum = 0;

  void increaseNumberOfDie() {
    setState(() {
      /// UPDATED HERE
      // diceWidgets.add(DiceGenerator());
      diceControllers.add(DiceController());
      dieCount++;
    });
  }

  void decreaseNumberOfDie() {
    ///
    if (dieCount > 0) {
      setState(() {
        diceControllers.removeLast();
        dieCount--;
      });
    }

    /// UPDATED HERE
    ///
    /// it is nice that you considered <0
    ///
    // if (diceWidgets.isNotEmpty){
    //   setState(() {
    //     diceWidgets.removeLast();
    //     dieCount --;
    //   });
    // }
  }

  /// UPDATED HERE
  ///
  /// this method rolls all dices
  /// not sure if intended or is the result from just exploring Flutter & Dart
  ///
  /// Either way, not a problem to have it is different from
  ///     what the assignment example does.
  ///

  // void rollDice(){
  //   setState(() {
  //     for (int i = 0; i < diceWidgets.length; i++){
  //       if (diceWidgets[i] is DiceGenerator){
  //         diceWidgets[i] = DiceGenerator(); // generate a new dice
  //       }
  //     }
  //   });
  // }

  void rollDice() {
    for (final controller in diceControllers) {
      controller.rollDice();
    }

    /// maybe use postframecallback so that dicecontrollerß udpate their "state" and then you can sum
  }

  // create a widget to add a dice
  /// UPDATED HERE please see the _IncreaseNumberOfDieWidget
  ///
  // Widget _increaseNumberOfDieWidget() {
  //   return ElevatedButton(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: Colors.grey[700],
  //       shape: StadiumBorder(),
  //     ),
  //     onPressed: () {
  //       setState(() {
  //         increaseNumberOfDie();
  //       });
  //     },
  //     // use a widget for the buttons styling
  //     child: ButtonTextStylingWidget(buttonText: "Add a die!"),
  //   );
  // }

  /// should have the same as the other one
// create a widget to remove a dice
  Widget _decreaseNumberOfDieWidget() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[700],
        shape: StadiumBorder(),
      ),
      onPressed: decreaseNumberOfDie,
      // use a widget for the buttons styling
      child: ButtonTextStylingWidget(buttonText: "Remove a die!"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: CustomAppBar(), // import the widget from utils
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
                    // this still has to be refractored
                    ElevatedButton(
                      onPressed: rollDice,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[700],
                        shape: StadiumBorder(),
                      ),
                      child: const Text(
                        "Roll the dice!",
                        style: TextStyle(
                          fontFamily: 'Caveat',
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 63, 199, 204),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "this is dice sum: ",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 63, 199, 204),
                      ),
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
                          increaseNumberOfDie();
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
            Column(
                // here should be all the widgets which spawn a dice and it's num
                //// UPDATED HERE
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

/// Better ... this is how flutter optimizes the build process
/// As child for another widget,
/// the _IncreaseNumberOfDieWidget is not always recreated even if the build method is called
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

class DiceController extends ChangeNotifier {
  ValueNotifier<int> currentValue = ValueNotifier(getRandomNumber());
  void rollDice() {
    currentValue.value = getRandomNumber();
  }
}
