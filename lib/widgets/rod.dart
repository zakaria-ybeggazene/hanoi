import 'package:flutter/material.dart';

import './disk.dart';

class Rod extends StatefulWidget {
  final bool initial;
  final int id;

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
    // Disk emptyDisk = Disk(
    //   diskSize: 0,
    //   currentRodId: widget.id,
    // );
    double rodHeight = 150;
    int numberOfDisks = widget.initial ? 3 : 0;
    int i = numberOfDisks;
    // initialRod ? rodHeight = 105 : rodHeight = 150;
    if (widget.initial) {
      for (i = 0; i < numberOfDisks; i++) {
        disksList.add(
          Disk(
            diskSize: numberOfDisks - i,
            currentRodId: widget.id,
          ),
        );
      }
      // topDisk = Disk.disk1;
      // middleDisk = Disk.disk2;
      // bottomDisk = Disk.disk3;
    }
    else {
      for (i = 0; i < numberOfDisks; i++) {
        disksList.add(
          Disk(
            diskSize: 0,
            currentRodId: widget.id,
          ),
        );
      }
      // topDisk = middleDisk = bottomDisk = emptyDisk;
    }
    print(disksList.length);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return DragTarget<Disk>(
      onAccept: (acceptedDisk) {
        Disk compareDisk;
        compareDisk = disksList.first;
        if (acceptedDisk.diskSize > compareDisk.diskSize && numberOfDisks < 4) {
          setState(() {
            disksList.add(acceptedDisk);
            numberOfDisks++;
          });
        }
        // if (rodHeight > 0) rodHeight = rodHeight - 15;
      },
      onLeave: (leftDisk) {
        if (numberOfDisks > 0) {
          // disksList.removeLast();
          numberOfDisks--;
        }
        // if (rodHeight < 150) rodHeight = rodHeight + 15;
      },
      onWillAccept: (hoveringDisk) {
        // print(disksList.last.diskSize);
        if (hoveringDisk.diskSize > disksList.last.diskSize) {
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
                  for (int i = 0; i < disksList.length; i++)
                    Positioned(
                      child: disksList[i],
                      bottom: 15.0 * i,
                    )
                  // ...disksList.map((disk) {
                  //   return Positioned(child: disk, bottom: 30 * ,);
                  // }),
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
