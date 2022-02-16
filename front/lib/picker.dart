import 'package:flutter/material.dart';

class Picker extends StatefulWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  int mode = 0;

  void _cycleMode() {
    setState(() {
      if (mode < 4) {
        mode++;
      } else {
        mode = 0;
      }
    });
  }

  void _setMode(int m) {
    setState(() {
      mode = m;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                  onPressed: () => _cycleMode(),
                  child: Text("Mode : " + mode.toString()))),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: ElevatedButton(
                onPressed: () => _setMode(0), child: const Text("0")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                onPressed: () => _setMode(1), child: const Text("1")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                onPressed: () => _setMode(2), child: const Text("2")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                onPressed: () => _setMode(3), child: const Text("3")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                onPressed: () => _setMode(4), child: const Text("4")),
          ),
        ],
      ),
    );
  }
}
