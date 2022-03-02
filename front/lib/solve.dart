import 'package:event/event.dart';
import 'package:front/service/grid_service.dart';
import 'package:io_graph/io_graph.dart';

gridToGraph() {
  var grid = GridService().values;
  var size = GridService().size;

  var start;
  var end;

  var nodes = List<Node<int>>.empty(growable: true);

  for (var i = 0; i < size; i++) {
    for (var j = 0; j < size; j++) {
      var value = grid[i][j];
      Node<int> n = Node(value);

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

  return Graph(nodes, start, end);
}

solveDikstra() {
  return gridToGraph().dikstra();
}
