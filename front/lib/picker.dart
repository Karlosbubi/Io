import 'package:flutter/material.dart';

import './data.dart';

class Picker extends StatefulWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  var colour = Colors.lightGreen;

  void update(int m) {
    setState(() {
      mode = m;
    });
    _colour();
  }

  void _colour() {
    setState(() {
      switch (mode) {
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
    });
  }

  void cycle() {
    setState(() {
      if (mode < 5) {
        mode++;
      } else {
        mode = 1;
      }
    });
    _colour();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(colour)),
                  onPressed: () => cycle(),
                  child: Text("Mode : " + mode.toString()))),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightGreen)),
                onPressed: () => update(1),
                child: const Text("1")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow)),
                onPressed: () => update(2),
                child: const Text("2")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange)),
                onPressed: () => update(3),
                child: const Text("3")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () => update(4),
                child: const Text("4")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey)),
                onPressed: () => update(5),
                child: const Text("5")),
          ),
        ],
      ),
    );
  }
}
