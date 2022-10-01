import 'dart:math';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:front/grid.dart';
// dart code file
import 'package:event/event.dart';

class GridService {
  static final GridService _singleton = GridService._();
  factory GridService() {
    return _singleton;
  }

  GridService._() {
    makeValues(size);
  }

  makeValues(int s) {
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

  static const int strasse = 1;
  static const int weg = 2;
  static const int wald = 3;
  static const int berg = 4;
  static const int schlucht = 5;
  static const int start = 98;
  static const int ziel = 99;
  static const int path = 0;

  //
  void updateColor(int x, int y) {
    if (mode == start) {
      mode = 1;
      updateColor(startX, startY);
      startX = x;
      startY = y;
      mode = start;
    }
    if (mode == ziel) {
      mode = 1;
      updateColor(endX, endY);
      endX = x;
      endY = y;
      mode = ziel;
    }
    values[x][y] = mode;
  }

  Color modeToColor(int m) {
    switch (m) {
      case weg:
        return Colors.yellow;

      case wald:
        return Colors.orange;
      case berg:
        return Colors.red;
      case schlucht:
        return Colors.blueGrey;

      case path:
        return Colors.lightBlueAccent;

      case start:
        return Colors.purple;

      case ziel:
        return Colors.deepPurple;

      case strasse:
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
    int d = start;
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

  gridResize(int a) {
    size = a;
  }
}
