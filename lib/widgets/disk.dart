import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Disk extends StatefulWidget {
  final int diskSize;
  final int currentRodId;
  final bool accepted;

  Disk(
      {@required this.diskSize,
      @required this.currentRodId,
      @required this.accepted});

  @override
  createState() => _DiskState();
}

class _DiskState extends State<Disk> {
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

  @override
  Widget build(BuildContext context) {
    int _currentRodId = widget.currentRodId;
    double diskWidth;
    if (widget.diskSize > 0) {
      diskWidth = widget.diskSize * 30.0;
    } else {
      diskWidth = 0;
    }
    return Draggable<Disk>(
      data: Disk(
        diskSize: widget.diskSize,
        currentRodId: _currentRodId,
        accepted: true,
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
    );
  }
}
