import 'package:flutter/material.dart';

import '../widgets/rod_build.dart';
import '../models/rod.dart';
import '../models/disk.dart';

class GameScreen extends StatefulWidget {
  static List<Disk> list1 = [];
  static List<Disk> list2 = [];
  static List<Disk> list3 = [];
  static Rod rod1 = Rod(id: 1, disksList: list1);
  static Rod rod2 = Rod(id: 2, disksList: list2);
  static Rod rod3 = Rod(id: 3, disksList: list3);

  static List<Rod> rodList = [rod1, rod2, rod3];

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
                RodBuild(GameScreen.rod1),
                RodBuild(GameScreen.rod2),
                RodBuild(GameScreen.rod3)
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
