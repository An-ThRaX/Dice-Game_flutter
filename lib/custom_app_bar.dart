// create a widget for the AppBar
import 'package:flutter/material.dart';

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