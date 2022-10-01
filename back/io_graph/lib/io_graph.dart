library io_graph;

import 'dart:core';
//import 'dart:math';

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

  Graph(this.nodes, this.start, this.end);

  Node<T> start;
  Node<T> end;

  List<Node<T>> dikstra() {
    List<Node<T>> checking = {start}.toList();
    List<Node<T>> checkNext = List.empty(growable: true);

    start.reachCost = 0;

    while (checking.isNotEmpty) {
      for (var i in checking) {
        for (var n in i.neighbours) {
          if (i.reachCost + n.edgeCost < n.to.reachCost) {
            n.to.reachCost = i.reachCost + n.edgeCost;
            n.to.previous = i;

            checkNext.add(n.to);
          }
        }
      }
      checking = checkNext;
      checkNext = List.empty(growable: true);
    }

    //Build Path
    Node<T> tmp = end;
    while (tmp != start) {
      path.add(tmp);
      tmp = tmp.previous;
    }
    path.add(start);
    path = path.reversed.toList();

    return path;
  }

  /*List<Node<T>> aStar(Node<T> start, Node<T> end) {
    List<Node<T>> checking = {start}.toList();
    List<Node<T>> checkNext = List.empty(growable: true);

    start.reachCost = 0;

    for (var i in nodes) {
      var x = end.x - i.x;
      var y = end.y - i.y;

      if (x < 0) {
        x = x * -1;
      }
      if (y < 0) {
        y = y * -1;
      }

      i.distance = sqrt((y * y) + (x * x));
    }

    while (checking.isNotEmpty) {
      for (var i in checking) {
        for (var n in i.neighbours) {
          if (i.reachCost + n.edgeCost < n.to.reachCost) {
            n.to.reachCost = i.reachCost + n.edgeCost;
            n.to.previous = i;

            checkNext.add(n.to);
          }
        }
      }
      checking = checkNext;
      checkNext = List.empty(growable: true);
    }

    //Build Path
    Node<T> tmp = end;
    while (tmp != start) {
      path.add(tmp);
      tmp = tmp.previous;
    }
    path.add(start);
    path = path.reversed.toList();

    return path;
  }
  */

  /*@override
  String toString() {
    var msg = "";
    for (var node in nodes) {
      msg += node.toString();
      msg += "\n";
      for (var n in node.neighbours) {
        msg += "\t - ";
        msg += n.to.toString();
        msg += "\n";
      }
      msg += "\n";
    }
    return msg;
  }*/
  @override
  String toString() {
    var msg = "";

    return msg;
  }
}

class Node<T> {
  T data;

  List<Link<T>> neighbours = List.empty(growable: true);

  int reachCost = INT_MAX;
  late Node<T> previous;
  late double distance;

  int x = 0;
  int y = 0;

  //Node(this.data);
  Node(this.data, this.x, this.y);

  @override
  String toString() {
    return data.toString();
  }
}

class Link<T> {
  int edgeCost;
  Node<T> to;

  Link(this.edgeCost, this.to);
}
