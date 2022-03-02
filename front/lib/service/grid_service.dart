import 'dart:math';

import 'package:flutter/material.dart';
import 'package:front/grid.dart';

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
  int size = 40;
  late List<List<int>> values;

  int startX = 0;
  int startY = 0;

  int endX = 0;
  int endY = 0;

  void updateColor(int x, int y) {
    if (mode == 99) {
      mode = 1;
      updateColor(startX, startY);
      startX = x;
      startY = y;
      mode = 99;
    }
    if (mode == 100) {
      mode = 1;
      updateColor(endX, endY);
      endX = x;
      endY = y;
      mode = 100;
    }
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

      case 6:
        return Colors.lightBlueAccent;

      case 98:
        return Colors.purple;

      case 99:
        return Colors.deepPurple;

      case 1:
      default:
        return Colors.lightGreen;
    }
  }

  Color get activeColor => modeToColor(mode);

  gridFill() {
    for (int i = 0; i < size; i++) {
      for (int k = 0; k < size; k++) {
        int b = 0;
        var a = Random();
        b = a.nextInt(6);
        values[k][i] = b;
      }
      //print(i);
    }
  }

  gridClear() {
    for (int i = 0; i < size; i++) {
      for (int k = 0; k < size; k++) {
        values[k][i] = 1;
      }
      //print(i);
    }
  }
}

 /* gridSZ() {
    for (int i = 0; i < size; i++) {
      for (int k = 0; k < size; k++) {
        int b = 0;
        var a = Random();
        b = a.nextInt(6);
        values[k][i] = b;
      }
      //print(i);
    }
    */
  
