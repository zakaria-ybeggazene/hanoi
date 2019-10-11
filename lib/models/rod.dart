import 'package:flutter/foundation.dart';

import './disk.dart';

class Rod {
  final int id;

  List<Disk> disksList = [];

  Rod({@required this.id, @required this.disksList});
}
