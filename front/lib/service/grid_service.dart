import 'package:flutter/material.dart';

class GridService {
  static final GridService _singleton = GridService._();
  factory GridService() {
    return _singleton;
  }

  GridService._() {
    values = [];

    for (int x = 0; x < size; x++) {
      List<int> column = [];
      for (int y = 0; y < size; y++) {
        column.add(mode);
      }

      values.add(column);
    }
  }

  int mode = 1;
  int size = 20;
  late List<List<int>> values;

  void updateColor(int x, int y) {
    values[x][y] = mode;
  }

  Color modeToColor(int m) {
    switch (m) {
      case 2:
        return Colors.yellow;

      case 3:
        return Colors.orange;

      case 4:
        return Colors.red;

      case 5:
        return Colors.blueGrey;

      case 1:
      default:
        return Colors.lightGreen;
    }
  }

  Color get activeColor => modeToColor(mode);
}
