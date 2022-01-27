library io_graph;

///OG Clac
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

  Node(this.data);
}

class Link {
  int edgeCost;
  Node<Object> node;

  Link(this.edgeCost, this.node);
}
