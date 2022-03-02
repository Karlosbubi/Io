import 'package:flutter/material.dart';
import 'package:front/service/grid_service.dart';

class Picker extends StatefulWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  Color colour = Colors.lightGreen;

  void update(int m) {
    setState(() {
      GridService().mode = m;
      _colour();
    });
  }

  void cycle() {
    setState(() {
      if (GridService().mode < 5) {
        update(GridService().mode + 1);
      } else {
        update(1);
      }
    });
    _colour();
  }

  void _colour() {
    setState(() {
      colour = GridService().activeColor;
    });
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
                    backgroundColor: MaterialStateProperty.all(
                        GridService().modeToColor(99))),
                onPressed: () => update(99),
                child: Text("Start")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        GridService().modeToColor(100))),
                onPressed: () => update(100),
                child: Text("Ziel")),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(colour)),
                  onPressed: () => cycle(),
                  child: Text("Mode : ${GridService().mode}"))),
          for (int i = 1; i < 6; i++)
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          GridService().modeToColor(i))),
                  onPressed: () => update(i),
                  child: Text("$i")),
            ),
        ],
      ),
    );
  }
}
