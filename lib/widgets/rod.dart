import 'package:flutter/foundation.dart';
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
  int numberOfDisks = 3;
  // bool firstInit = true;

  @override
  void initState() {
    // if (firstInit) {
    if (widget.initial) {
      int i = numberOfDisks;
      for (i = 0; i < numberOfDisks; i++) {
        disksList.add(
          Disk(
            diskSize: numberOfDisks - i,
            currentRodId: widget.id,
            accepted: true,
          ),
        );
      }
    }
    // }
    // firstInit = false;
    super.initState();
  }

  @override
  void didUpdateWidget(Rod oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  Future<bool> _acceptedDisk(Disk disk) {
    // return disk.accepted;
  }

  @override
  Widget build(BuildContext context) {
    double rodHeight = 150;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return DragTarget<Disk>(
      onAccept: (acceptedDisk) {
        print('acceptedDisk accepted : ${acceptedDisk.accepted}');
        if (disksList.length > 0) {
          if (acceptedDisk.diskSize < disksList.last.diskSize &&
              disksList.length <= numberOfDisks) {
            disksList.add(acceptedDisk);
            disksList.last = Disk(
              diskSize: disksList.last.diskSize,
              currentRodId: widget.id,
              accepted: true,
            );
          }
        } else {
          disksList.add(acceptedDisk);
        }
        print('length of the rod${widget.id} is ${disksList.length}');
        if (widget.id == 3 && disksList.length == numberOfDisks) {
          print('You won');
          showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: Text('You Won!'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Replay'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        }
      },
      onLeave: (leavingDisk) {
        Disk leftDisk;
        // print('leftOnce = $leftOnce');
        if (disksList.length > 0 && !leavingDisk.accepted) {
          leftDisk = disksList.removeLast();
        }
        print('length of the rod${widget.id} is ${disksList.length}');
      },
      onWillAccept: (hoveringDisk) {
        print(hoveringDisk.currentRodId);
        if (disksList.length == 0) {
          print('here1');
          print('hoveringDisk accepted : ${hoveringDisk.accepted}');
          // print('leftOnce = $leftOnce');
          return true;
        } else {
          if (hoveringDisk.diskSize < disksList.last.diskSize &&
              disksList.length <= numberOfDisks &&
              hoveringDisk.currentRodId == widget.id) {
            print('here2');
            disksList.last = Disk(
              diskSize: hoveringDisk.diskSize,
              currentRodId: hoveringDisk.currentRodId,
              accepted: false,
            );
            // && hoveringDisk.currentRodId != widget.id
            // print('hello ${widget.id}');
            return true;
          }
          print('here3');
          return false;
        }
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
                    ),
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
