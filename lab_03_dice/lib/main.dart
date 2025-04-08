import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceApp(),
    );
  }
}

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int dice_1 = 1;
  int dice_2 = 1;

  void roll() {
    setState(() {
      dice_1 = Random().nextInt(6) + 1;
      dice_2 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dice")),
      body: GestureDetector(
        onTap: roll,
        child: SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/dice_1/0$dice_1.jpg", width: 100, height: 100,),
                SizedBox(width: 8),
                Image.asset("assets/dice_2/0$dice_2.jpg", width: 100, height: 100,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
