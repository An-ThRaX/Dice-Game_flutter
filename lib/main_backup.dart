import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 8, 175, 153),
        title: const Text(
          "DiceMania",
          style: TextStyle(
            fontFamily: "Caveat",
            fontSize: 20,
            color:  Color.fromARGB(255, 128, 34, 27),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Row(
        children: [
          Text("This is a dice game. Roll to find you luck.")
        ],
      )
    );
  }
}