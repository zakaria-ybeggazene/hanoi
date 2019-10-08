import 'package:flutter/material.dart';

import '../widgets/rod.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            color: Colors.lightGreen,
            height: MediaQuery.of(context).size.height - 300,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Rod(
                  initial: true,
                  id: 1,
                ),
                Rod(
                  initial: false,
                  id: 2,
                ),
                Rod(
                  initial: false,
                  id: 3,
                ),
              ],
            ),
          ),
          // Flexible(
          //   child: Container(
          //     color: Colors.lightGreen,
          //   ),
          // ),
        ],
      ),
    );
  }
}
