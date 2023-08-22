import 'package:flutter/material.dart';
import 'dart:math';
import 'package:the_die_game/main.dart';


// define a method to get a random number for the dice
int getRandomNumber(){
  final random = Random();
  return random.nextInt(6)+1;
}




// create widgets which returns a "dice" with a random number in it

// class DiceGenerator extends StatelessWidget {
//   DiceGenerator({super.key});
  

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 55,
//       height: 55,
//       color: Colors.grey[300],
//       child: Center(
//         child: Text(
//           "$result",
//           style: const TextStyle(
//             fontFamily: "Caveat",
//             fontSize: 10,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }


// create a widget to add a logo

class AddLogoWidget extends StatelessWidget {
  const AddLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/pictures/dice2a.jpg"),
        radius: 40.0,
      ),
    );
  }
}

