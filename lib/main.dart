// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:the_die_game/utils.dart';

void main() => runApp(MaterialApp(
  home: DiceGame(),
));

class DiceGame extends StatefulWidget {
  const DiceGame({super.key});

  @override
  State<DiceGame> createState() => _DiceGameState();
}

// create a widget which will generate a new dice with a random num 
class DiceGenerator extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    final int randomDieNumber = getRandomNumber();

    return Container(
      width: 55,
      height: 55,
      color: Colors.grey[300],
      child: Center(
        child: Text(
          "$randomDieNumber",
          style: const TextStyle(
            fontFamily: "Caveat",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


class _DiceGameState extends State<DiceGame> {
  List <Widget> diceWidgets = []; // Store the dice widgets
  int dieCount = 0;
  int sum =0;
  


  void increaseNumberOfDie(){
    setState(() {
      diceWidgets.add(DiceGenerator());
      dieCount ++;


    });
  }


  void decreaseNumberOfDie(){
    if (diceWidgets.isNotEmpty){
      setState(() {
        diceWidgets.removeLast();
        dieCount --;
      });
    }
  }

  void rollDice(){
    setState(() {
      for (int i = 0; i < diceWidgets.length; i++){
        if (diceWidgets[i] is DiceGenerator){
          diceWidgets[i] = DiceGenerator(); // generate a new dice
        }
      }
    });
  }


// create a widget to add a dice
  Widget _increaseNumberOfDieWidget(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[700],
        shape: StadiumBorder(),
        ),
      onPressed: (){
        setState(() {
          increaseNumberOfDie();
        });
      },
      // use a widget for the buttons styling
      child: ButtonTextStylingWidget(buttonText: "Add a die!"),
    );
  }


// create a widget to remove a dice
  Widget _decreaseNumberOfDieWidget(){
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
              height: 60.0,  // is the height above and under the line
              color: Colors.grey[800],
            ),

            Row(  // main top row which will hold the two rows which have the buttons
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row( // first row which will hold "Roll the dice" and the sum
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
                    SizedBox(width: 15.0,),
                    Text(
                      "this is dice sum: ",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 63, 199, 204),
                      ),
                    ),
                  ],
                ),
                Row( // second row which holds the widgets for "Add a die", total num of die
                // and the "Remove a die"
                  children: [
                    // call the widget which builds the button to add die
                    _increaseNumberOfDieWidget(),

                    SizedBox(width: 15.0,),

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
            Divider(  // creates the line under the thumb picture
              height: 60.0,  // is the height above and under the line
              color: Colors.grey[800],
            ),
            Column(
              // here should be all the widgets which spawn a dice and it's num
              children: diceWidgets,
            ),
          ],
        ),
      ),
    );
  }
}



