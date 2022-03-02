import 'package:flutter/material.dart';
import 'package:front/service/grid_service.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  void _refresh(int x, int y) {
    setState(() {
      GridService().updateColor(x, y);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        primary: false,
        shrinkWrap: true,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid.count(
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              crossAxisCount: GridService().size,
              children: List<NodeWidget>.generate(
                GridService().size * GridService().size,
                (index) {
                  int x = (index % GridService().size);
                  int y = (index / GridService().size).floor();

                  return NodeWidget(
                    x,
                    y,
                    GridService().values[x][y],
                    GridService().modeToColor(GridService().values[x][y]),
                    update: _refresh,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NodeWidget extends StatelessWidget {
  final int x;
  final int y;
  final int value;
  final Color colour;

  final Function(int, int) update;

  NodeWidget(
    this.x,
    this.y,
    this.value,
    this.colour, {
    Key? key,
    required this.update,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colour)),
      child: Text(
        " ",
        style: const TextStyle(fontSize: 15.0),
      ),
      onPressed: () => update(x, y),
    );
  }
}
