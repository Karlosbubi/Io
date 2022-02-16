import 'package:flutter/material.dart';

import './grid.dart';
import './picker.dart';

void main() => runApp(const MyApp());

int mode = 0; //TODO : Nicht mehr Global, State management

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pathfinding',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Krasser Pathfinder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var mainGrid = const Grid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Row(
            children: [
              const Picker(),
              Expanded(
                child: mainGrid,
              ),
            ],
          ),
        ));
  }
}
