library io_graph;

// ignore: constant_identifier_names
const int INT_MAX = 9007199254740991;

/// OG Clac
class Calculator {
  int addOne(int value) => value + 1;
}

/// A Graph
class Graph<T> {
  List<Node<T>> nodes = List.empty(growable: true);
  late Node<T> start;
  late Node<T> end;

  Graph(this.nodes) {
    start = nodes.first;
    end = nodes.last;
  }
}

class Node<T> {
  T data;

  List<Link> neighbours = List.empty(growable: true);

  int reachCost = INT_MAX;
  Node<T>? previous = null;

  Node(this.data);
}

class Link {
  int edgeCost;
  Node<Object> from;
  Node<Object> to;

  Link(this.edgeCost, this.from, this.to);
}
