import 'package:flutter/material.dart';

import 'data.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: () => {dataUpdate.broadcast()},
                child: const Text("Solve"))),
        Expanded(
            child: ElevatedButton(
                onPressed: () => {dataUpdate.broadcast()},
                child: const Text("Resize"))),
      ],
    );
  }
}
