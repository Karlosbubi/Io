library io_graph;

import 'dart:core';

import 'package:flutter/cupertino.dart';

// ignore: constant_identifier_names
const int INT_MAX = 9007199254740991;

/// OG Clac
class Calculator {
  int addOne(int value) => value + 1;
}

/// A Graph
class Graph<T> {
  List<Node<T>> nodes = List.empty(growable: true);
  List<Node<T>> path = List.empty(growable: true);

  Graph(this.nodes);

  List<Node<T>> dikstra(Node<T> start, Node<T> end) {
    List<Node<T>> toCheck = List.empty(growable: true);
    List<Node<T>> staged = List.empty(growable: true);

    start.reachCost = 0;
    toCheck.add(start);

    while (toCheck.isNotEmpty) {
      for (var i in toCheck) {
        for (var n in i.neighbours) {
          if (i.reachCost + n.edgeCost < n.to.reachCost) {
            n.to.reachCost = i.reachCost + n.edgeCost;
            n.to.previous = i;

            staged.add(n.to);
          }
        }
      }
      toCheck.addAll(staged);
    }

    //Build Path
    Node<T> tmp = end;
    while (tmp != start) {
      path.add(tmp);
      tmp = tmp.previous;
    }
    path = path.reversed.toList();

    return path;
  }
}

class Node<T> {
  T data;

  List<Link<T>> neighbours = List.empty(growable: true);

  int reachCost = INT_MAX;
  late Node<T> previous;

  Node(this.data);
}

class Link<T> {
  int edgeCost;
  Node<T> to;

  Link(this.edgeCost, this.to);
}
