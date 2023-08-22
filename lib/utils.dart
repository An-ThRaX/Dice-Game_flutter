import 'package:flutter/material.dart';
import 'dart:math';
import 'package:the_die_game/main.dart';


// define a method to get a random number for the dice
int getRandomNumber(){
  final random = Random();
  return random.nextInt(6)+1;
  
}


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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  
  // what the heck is this??????
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Welcome to the dice game!",
        style: TextStyle(
          fontFamily: 'Caveat',
          color: Color.fromARGB(255, 63, 199, 204),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.grey[850],
      elevation: 0,
    );
  }
}

