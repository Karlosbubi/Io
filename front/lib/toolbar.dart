import 'package:flutter/material.dart';

import 'data.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          ElevatedButton(
              onPressed: () => {dataUpdate.broadcast()},
              child: const Text("Solve")),
          ElevatedButton(
              onPressed: () => {dataUpdate.broadcast()},
              child: const Text("Resize")),
        ],
      ),
    );
  }
}
