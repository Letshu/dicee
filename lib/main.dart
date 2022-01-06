// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: diceChange(),
      ),
    ),
  );
}

class diceChange extends StatefulWidget {
  const diceChange({Key? key}) : super(key: key);

  @override
  _diceChangeState createState() => _diceChangeState();
}

class _diceChangeState extends State<diceChange> {
  int leftDice = 1;
  int rightDice = 2;

  void changeState() {
    setState(() {
      Random randNum = Random();
      rightDice = randNum.nextInt(6) + 1;
      leftDice = randNum.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    int sum = rightDice + leftDice;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      if (kDebugMode) {
                        print("Left box was clicked");
                        changeState();
                      }
                    },
                    child: Ink.image(
                      image: AssetImage("images/dice$leftDice.png"),
                      width: 200,
                      //Having a width and height limits onTap functionality to just that
                      height: 200,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      if (kDebugMode) {
                        print("Right dice was pressed");
                        changeState();
                      }
                    },
                    child: Ink.image(
                      image: AssetImage('images/dice$rightDice.png'),
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "Your score is : $sum",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
