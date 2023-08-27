import 'package:flutter/material.dart';


// create a widget to add the app logo
class AddLogoWidget extends StatelessWidget {
  const AddLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/pictures/dice2a.jpg"),
        radius: 40.0,
      ),
    );
  }
}






