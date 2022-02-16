import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GridState();
}

class _GridState extends State<Grid> {
  int mode = 0;

  int b1 = 0;
  int b2 = 0;
  int b3 = 0;

  _GridState();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(25),
                child: ElevatedButton(
                  child: Text(
                    b1.toString(),
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    setState(() {
                      b1 = mode!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: ElevatedButton(
                  child: Text(
                    b2.toString(),
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    setState(() {
                      b2 = mode!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: ElevatedButton(
                  child: Text(
                    b3.toString(),
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    setState(() {
                      b3 = mode!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
