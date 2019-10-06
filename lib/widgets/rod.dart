import 'package:flutter/material.dart';

import './disk.dart';

class Rod extends StatefulWidget {
  final bool initial;

  Rod({this.initial, this.id});
  @override
  State<StatefulWidget> createState() {
    return _RodState();
  }
}

class _RodState extends State<Rod> {
  List<Disk> disksList = [];

  @override
  Widget build(BuildContext context) {
    bool accepted = false;
    Disk emptyDisk = Disk(
      diskSize: 0,
      currentRodId: widget.id,
    );
    Disk topDisk;
    Disk middleDisk;
    Disk bottomDisk;
    bool initialRod = widget.initial;
    double rodHeight = 150;
    int numberOfDisks = widget.initial ? 3 : 0;
    int i = numberOfDisks;
    // initialRod ? rodHeight = 105 : rodHeight = 150;
    if (initialRod) {
      for (i = 0; i < numberOfDisks; i++) {
        disksList[i] = Disk(
          diskSize: i + 1,
          currentRodId: widget.id,
        );
      }
      topDisk = Disk.disk1;
      middleDisk = Disk.disk2;
      bottomDisk = Disk.disk3;
    } else {
      topDisk = middleDisk = bottomDisk = emptyDisk;
    }
    initialRod = false;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return DragTarget<Disk>(
      onAccept: (acceptedDisk) {
        Disk compareDisk;
        if (numberOfDisks == 0) {
          compareDisk = emptyDisk;
        } else if (numberOfDisks == 1) {
          compareDisk = bottomDisk;
        } else if (numberOfDisks == 2) {
          compareDisk = middleDisk;
        } else if (numberOfDisks == 3) {
          compareDisk = topDisk;
        }
        if (acceptedDisk.diskSize > compareDisk.diskSize && numberOfDisks < 4) {
          if (numberOfDisks == 0) {
            bottomDisk = acceptedDisk;
            bottomDisk.currentRodId = widget.id;
          } else if (numberOfDisks == 1) {
            middleDisk = acceptedDisk;
            middleDisk.currentRodId = widget.id;
          } else if (numberOfDisks == 2) {
            topDisk = acceptedDisk;
            topDisk.currentRodId = widget.id;
          }
          numberOfDisks++;
        }
        // if (rodHeight > 0) rodHeight = rodHeight - 15;
      },
      onLeave: (leftDisk) {
        if (numberOfDisks == 1) {
          bottomDisk = emptyDisk;
        } else if (numberOfDisks == 2) {
          middleDisk = emptyDisk;
        } else if (numberOfDisks == 3) {
          topDisk = emptyDisk;
        }
        if (numberOfDisks > 0) numberOfDisks--;
        // if (rodHeight < 150) rodHeight = rodHeight + 15;
      },
      onWillAccept: (hoveringDisk) {
        if (hoveringDisk.diskSize > disksList.first.diskSize) {
          print('hello ${widget.id}');
          return true;
        }
        return false;
      },
      builder: (BuildContext context, List<Disk> candidateData, rejectedData) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: deviceWidth / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    child: Container(
                      color: Colors.blueGrey,
                      height: rodHeight,
                      width: 10,
                    ),
                  ),
                  Positioned(
                    bottom: 30 * (numberOfDisks - 3),
                    child: bottomDisk,
                  ),
                  Positioned(
                    bottom: 30 * (numberOfDisks - 2),
                    child: middleDisk,
                  ),
                  Positioned(bottom: 30 * (numberOfDisks - 1), child: topDisk),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 300,
              ),
            ],
          ),
        );
      },
    );
  }
}

// trigger when win
// if (widget.id == 3 &&
//             bottomDisk == Disk.disk3 &&
//             middleDisk == Disk.disk2 &&
//             topDisk == Disk.disk1) {
//           print('You won');
//           showDialog(
//               context: context,
//               builder: (ctx) {
//                 return AlertDialog(
//                   title: Text('You Won!'),
//                   actions: <Widget>[
//                     FlatButton(
//                       child: Text('Replay'),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     )
//                   ],
//                 );
//               });
//         }
