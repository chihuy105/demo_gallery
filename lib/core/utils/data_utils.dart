import 'dart:math';

import 'package:demo_gallery/all_file/all_file.dart';

class DataUtils{
  DataUtils._();

  static String generateTag() {
    DateTime dateTime = DateTime.now();
    String tag = Random().nextInt(1000).toString() +
        Random().nextInt(1000).toString() +
        dateTime.second.toString() +
        dateTime.millisecond.toString() +
        dateTime.microsecond.toString();
    return tag;
  }
}
