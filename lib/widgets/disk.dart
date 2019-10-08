import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Disk extends StatelessWidget {
  final int diskSize;
  final int currentRodId;

  // static Disk disk0 = Disk(
  //   diskSize: 0,
  //   currentRodId: 0,
  // );
  // static Disk disk1 = Disk(
  //   diskSize: 1,
  //   currentRodId: 1,
  // );
  // static Disk disk3 = Disk(
  //   diskSize: 3,
  //   currentRodId: 1,
  // );
  // static Disk disk2 = Disk(
  //   diskSize: 2,
  //   currentRodId: 1,
  // );

  Disk({@required this.diskSize, @required this.currentRodId});

  @override
  Widget build(BuildContext context) {
    double diskWidth;
    if (diskSize == 1) {
      diskWidth = 30;
    } else if (diskSize == 2) {
      diskWidth = 60;
    } else if (diskSize == 3) {
      diskWidth = 90;
    } else {
      diskWidth = 0;
    }
    return Draggable<Disk>(
      data: Disk(
        diskSize: diskSize,
        currentRodId: currentRodId,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.black,
          height: diskWidth == 0 ? 0 : 15,
          width: diskWidth,
        ),
      ),
      feedback: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.black,
          height: diskWidth == 0 ? 0 : 15,
          width: diskWidth,
        ),
      ),
      childWhenDragging: Container(),
      onDragCompleted: () {
        return Container();
      },
    );
  }
}
