import 'dart:js_util';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'solve.dart';
import 'service/grid_service.dart';

class Toolbar extends StatefulWidget {
  const Toolbar({Key? key}) : super(key: key);

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  void _refresh(int x) {
    setState(() {
      GridService().gridResize(x);
    });
    //return 0;
  }

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
                  onPressed: () => displaySolve(),
                  child: const Text("Solve"))),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (text) {
              _refresh(int.parse(text));
            },
          ),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              width: 100,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow)),
                  onPressed: () {},
                  child: const Text("Resize"))),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              width: 100,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent)),
                  onPressed: () => GridService().gridFill(),
                  child: const Text("Fill"))),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              width: 100,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () => GridService().gridClear(),
                  child: const Text("Clear"))),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              width: 100,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                  onPressed: () => GridService().gridSZ(),
                  child: const Text("Random Start/Ziel"))),
        ],
      ),
    );
  }
}
