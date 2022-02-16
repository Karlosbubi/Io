import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:io_graph/io_graph.dart';

import 'main.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GridState();
}

class _GridState extends State<Grid> {
  static const int size = 20;
  static const int count = size * size;

  var nodes =
      List<NodeWidget>.filled(count, const NodeWidget()); //TODO: Dynamic Size

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        primary: false,
        shrinkWrap: true,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              crossAxisCount: size,
              children: nodes,
            ),
          ),
        ],
      ),
    );
  }

  //solve() { // TODO
  //  //make graph
  //  List<List<Node<int>>> gNodes;
  //  for (int i = 0; i < size; i++) {
  //    for (int j = 0; j < size; j++) {
  //      Node n = Node(nodes[i + (j * size)].getValue() + 1);
  //      gNodes[i][j] = n;
  //    }
  //  }
  //}
}

class NodeWidget extends StatefulWidget {
  const NodeWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NodeWidgetState();

  int getValue() {
    return 0; //TODO get state out of here
  }
}

class _NodeWidgetState extends State<NodeWidget> {
  int value = 0;
  var colour = Colors.lightGreen;

  update(int m) {
    value = m;
    _refresh();
  }

  int getValue() {
    return value;
  }

  _refresh() {
    setState(() {
      value = value;
      switch (value) {
        case 1:
          colour = Colors.yellow;
          break;
        case 2:
          colour = Colors.orange;
          break;
        case 3:
          colour = Colors.red;
          break;
        case 4:
          colour = Colors.blueGrey;
          break;
        case 5:
          colour = Colors.lightBlue;
          break;
        case 0:
        default:
          colour = Colors.lightGreen;
          break;
      }
    });
  }

  _obtainMode() {
    value = mode;
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colour)),
      child: Text(
        value.toString(),
        style: const TextStyle(fontSize: 15.0),
      ),
      onPressed: () => _obtainMode(),
    );
  }
}
