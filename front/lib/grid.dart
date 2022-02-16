import 'package:flutter/material.dart';

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
}

class NodeWidget extends StatefulWidget {
  const NodeWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NodeWidgetState();
}

class _NodeWidgetState extends State<NodeWidget> {
  int value = 0;
  var colour = Colors.lightGreen;

  _obtainMode() {
    setState(() {
      value = mode;
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
