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
      margin: const EdgeInsets.only(left: 5, right: 0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            width: 100,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        GridService().modeToColor(98))),
                onPressed: () => update(98),
                child: Text("Start")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 100,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        GridService().modeToColor(99))),
                onPressed: () => update(99),
                child: Text("Ziel")),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 150),
              width: 100,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(colour)),
                  onPressed: () => cycle(),
                  child: Text("Mode : ${GridService().mode}"))),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 0, right: 0),
            width: 100,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        GridService().modeToColor(1))),
                onPressed: () => update(1),
                child: Text("Strasse")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 0, right: 0),
            width: 100,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        GridService().modeToColor(2))),
                onPressed: () => update(2),
                child: Text("Weg")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 0, right: 0),
            width: 100,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        GridService().modeToColor(3))),
                onPressed: () => update(3),
                child: Text("Wald")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 0, right: 0),
            width: 100,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        GridService().modeToColor(4))),
                onPressed: () => update(4),
                child: Text("Gebirge")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 0, right: 0),
            width: 100,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        GridService().modeToColor(5))),
                onPressed: () => update(5),
                child: Text("Schlucht")),
          ),
        ],
      ),
    );
  }
}
