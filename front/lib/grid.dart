import 'package:flutter/material.dart';
import './data.dart';

class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);

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
              crossAxisCount: dataGrid.size,
              children: List<NodeWidget>.generate(
                dataGrid.size * dataGrid.size,
                (index) => NodeWidget(
                    (index % dataGrid.size), (index / dataGrid.size).floor()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NodeWidget extends StatelessWidget {
  late final int value;
  final int x;
  final int y;
  late final MaterialColor colour;

  NodeWidget(this.x, this.y, {Key? key}) : super(key: key) {
    value = dataGrid.values[x][y];
    switch (value) {
      case 2:
        colour = Colors.yellow;
        break;
      case 3:
        colour = Colors.orange;
        break;
      case 4:
        colour = Colors.red;
        break;
      case 5:
        colour = Colors.blueGrey;
        break;
      case 1:
      default:
        colour = Colors.lightGreen;
        break;
    }
  }

  refresh() {
    dataGrid.values[x][y] = mode;
    dataUpdate.broadcast();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colour)),
      child: Text(
        value.toString(),
        style: const TextStyle(fontSize: 15.0),
      ),
      onPressed: () => refresh(),
    );
  }
}
