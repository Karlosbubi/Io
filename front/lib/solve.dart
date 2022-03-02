import 'package:front/service/grid_service.dart';
import 'package:io_graph/io_graph.dart';

gridToGraph() {
  var grid = GridService().values;
  var size = GridService().size;

  Node<int>? start;
  Node<int>? end;

  var nodes = List<Node<int>>.empty(growable: true);

  for (var i = 0; i < size; i++) {
    for (var j = 0; j < size; j++) {
      var value = grid[i][j];
      if (value == 5) {
        value = 99999;
      }
      Node<int> n = Node(value, i, j);

      if (i != 0) {
        n.neighbours.add(Link(value, nodes.last));
      }
      if (j != 0) {
        n.neighbours.add(Link(value, nodes.last));
      }

      if (i == GridService().startX && j == GridService().startY) {
        start = n;
      }
      if (i == GridService().endX && j == GridService().endY) {
        end = n;
      }

      nodes.add(n);
    }
  }

  for (var item in nodes) {
    for (var n in item.neighbours) {
      n.to.neighbours.add(Link(item.data, item));
    }
  }

  return Graph(nodes, start!, end!);
}

solveDikstra() {
  return gridToGraph().dikstra();
}

displaySolve() {
  var path = solveDikstra();

  for (var node in path) {
    GridService().values[node.x][node.x] = 6;
  }
}
