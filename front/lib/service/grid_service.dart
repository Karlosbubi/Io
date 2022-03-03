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
  int size = 20;
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
  static const int Path = 6;

  //
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
  
