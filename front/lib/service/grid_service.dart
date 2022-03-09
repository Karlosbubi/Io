import 'dart:math';

import 'package:flutter/material.dart';
import 'package:front/grid.dart';
// dart code file
import 'package:event/event.dart';

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

  var update = Event();

  int mode = 1;
  int size = 50;
  late List<List<int>> values;

  int startX = 0;
  int startY = 0;

  int endX = 0;
  int endY = 0;
  // die hier müssen noch definiert werden und nicht unbedingt als Variable abgespeichert sein

  static const int Strasse = 1;
  static const int Weg = 2;
  static const int Wald = 3;
  static const int Berg = 4;
  static const int Schlucht = 5;
  static const int Start = 98;
  static const int Ziel = 99;
  static const int Path = 0;

  //
  void updateColor(int x, int y) {
    if (mode == Start) {
      mode = 1;
      updateColor(startX, startY);
      startX = x;
      startY = y;
      mode = Start;
    }
    if (mode == Ziel) {
      mode = 1;
      updateColor(endX, endY);
      endX = x;
      endY = y;
      mode = Ziel;
    }
    values[x][y] = mode;
  }

  Color modeToColor(int m) {
    switch (m) {
      case Weg:
        return Colors.yellow;

      case Wald:
        return Colors.orange;

      case Berg:
        return Colors.red;

      case Schlucht:
        return Colors.blueGrey;

      case Path:
        return Colors.lightBlueAccent;

      case Start:
        return Colors.purple;

      case Ziel:
        return Colors.deepPurple;

      case Strasse:
      default:
        return Colors.lightGreen;
    }
  }

  Color get activeColor => modeToColor(mode);

  gridFill() {
    int speicher = mode;
    for (int i = 0; i < size; i++) {
      for (int k = 0; k < size; k++) {
        var a = Random();
        mode = a.nextInt(5) + 1;
        updateColor(k, i);
      }
    }
    mode = speicher;
  }

  gridClear() {
    int speicher = mode;
    mode = 1;
    for (int i = 0; i < size; i++) {
      for (int k = 0; k < size; k++) {
        updateColor(k, i);
      }
    }
    mode = speicher;
  }

  gridSZ() {
    int b = 0;
    int c = 0;
    int d = Start;
    int speicher = mode;
    var a = Random();
    for (int i = 0; i < 2; i++) {
      b = a.nextInt(size);
      c = a.nextInt(size);
      mode = d;
      updateColor(b, c);
      d++;
    }
    mode = speicher;
  }
}
