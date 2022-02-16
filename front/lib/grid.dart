import 'package:flutter/material.dart';

int mode = 0;

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GridState();
}

class _GridState extends State<Grid> {
  final int size = 10;

  var nodes = List<NodeWidget>.filled(100, const NodeWidget());

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
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
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

  _obtainNewValue() {
    setState(() {
      value = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        value.toString(),
        style: const TextStyle(fontSize: 20.0),
      ),
      onPressed: () => _obtainNewValue(),
    );
  }
}
