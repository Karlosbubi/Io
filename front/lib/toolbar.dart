import 'package:flutter/material.dart';
import 'solve.dart';
import 'service/grid_service.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 0),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 200, bottom: 15),
              width: 100,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrange)),
                  onPressed: () {
                    displaySolve();
                    GridService().update.broadcast();
                  },
                  child: const Text("Solve"))),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              width: 100,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow)),
                  onPressed: () => {GridService().update.broadcast()},
                  child: const Text("Resize"))),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              width: 100,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent)),
                  onPressed: () {
                    GridService().gridFill();
                    GridService().update.broadcast();
                  },
                  child: const Text("Fill"))),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              width: 100,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    GridService().gridClear();
                    GridService().update.broadcast();
                  },
                  child: const Text("Clear"))),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              width: 100,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                  onPressed: () {
                    GridService().gridSZ();
                    GridService().update.broadcast();
                  },
                  child: const Text("Random Start/Ziel"))),
        ],
      ),
    );
  }
}
