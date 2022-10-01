import 'package:front/service/grid_service.dart';
import 'package:io_graph/io_graph.dart';

gridToGraph() {
  var grid = GridService().values;
  var size = GridService().size;

  var nodes = List<List<Node<int>>>.empty(growable: true);

  for (var i = 0; i < size; i++) {
    var row = List<Node<int>>.empty(growable: true);
    for (var j = 0; j < size; j++) {
      var value = grid[i][j];
      if (value == 5) {
        value = 99999;
      }
      Node<int> n = Node(value, i, j);
      row.add(n);
    }
    nodes.add(row);
  }

  for (var i = 0; i < size; i++) {
    for (var j = 0; j < size; j++) {
      if (i != 0) {
        nodes[i][j].neighbours.add(Link(nodes[i][j].data, nodes[i - 1][j]));
        nodes[i - 1][j].neighbours.add(Link(nodes[i - 1][j].data, nodes[i][j]));
      }
      if (j != 0) {
        nodes[i][j].neighbours.add(Link(nodes[i][j].data, nodes[i][j - 1]));
        nodes[i][j - 1].neighbours.add(Link(nodes[i][j - 1].data, nodes[i][j]));
      }
    }
  }

  Node<int> start = nodes[GridService().startX][GridService().startY];
  Node<int> end = nodes[GridService().endX][GridService().endY];

  var tmp = List<Node<int>>.empty(growable: true);
  for (var l in nodes) {
    tmp.addAll(l);
  }
  var graph = Graph(tmp, start, end);
  //print(graph.toString());
  return graph;
}

solveDikstra() {
  var graph = gridToGraph().dikstra();
  //print(graph.toString());
  return graph;
}

displaySolve() {
  var path = solveDikstra();

  for (var node in path) {
    if (!((node.x == GridService().startX && node.y == GridService().startY) ||
        (node.x == GridService().endX && node.y == GridService().endY))) {
      //print(node.x);
      //print(node.y);
      //print("---");
      GridService().values[node.x][node.y] = 0;
    }
  }
}
