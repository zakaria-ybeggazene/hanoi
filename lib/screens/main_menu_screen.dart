import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hanoi/main.dart';

import 'package:numberpicker/numberpicker.dart';
import './game_screen.dart';

class MainMenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaineMenuScreenState();
  }
}

class _MaineMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    int numberOfDisks = 3;
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/HanoiLogo.png',
              scale: 2.8,
            ),
            SizedBox(
              height: 60,
            ),
            GestureDetector(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepOrange[300],
                      gradient: LinearGradient(
                          colors: [
                            Colors.deepOrange[500],
                            Colors.deepOrange[300],
                            Colors.deepOrange[500]
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  width: 150,
                  height: 50,
                  // color: Colors.deepOrange[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Play',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.w800),
                      ),
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30.0,
                      )
                    ],
                  ),
                ),
              ),
              dragStartBehavior: DragStartBehavior.down,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.deepOrange[50],
                        title: Text(
                          'Choose initial number of disks',
                          softWrap: true,
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                        titlePadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        actions: <Widget>[
                          NumberPicker.integer(
                            scrollDirection: Axis.horizontal,
                            minValue: 2,
                            maxValue: 6,
                            initialValue: 3,
                            itemExtent: 30,
                            onChanged: (selectedNumber) {
                              numberOfDisks = selectedNumber;
                            },
                          ),
                          FlatButton(
                            child: Text('Start'),
                            onPressed: () {
                              main();
                              if (numberOfDisks != null) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        GameScreen(numberOfDisks)));
                              }
                            },
                          )
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
