import 'package:flutter/material.dart';
import 'solve.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: displaySolve(), child: const Text("Solve"))),
        Expanded(
            child: ElevatedButton(
                onPressed: () => {}, child: const Text("Resize"))),
      ],
    );
  }
}
