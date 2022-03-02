import 'package:front/service/grid_service.dart';
import 'package:io_graph/io_graph.dart';

gridToGraph() {
  var grid = GridService().values;
  var size = GridService().size;

  var nodes = List<Node<int>>.empty(growable: true);

  for (var i = 0; i < size; i++) {
    for (var j = 0; j < size; j++) {
      Node<int> n = Node(grid[i][j]);

      nodes.add(n);
    }
  }

  return Graph(nodes);
}
