import 'package:flutter/material.dart';

class Disk {
  final int diskSize;
  final int currentRodId;
  bool draggable;

  Disk(
      {@required this.diskSize,
      @required this.currentRodId,
      this.draggable});
}
