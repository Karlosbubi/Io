import 'dart:io';

import 'package:flutter/material.dart';
import 'package:io_graph/io_graph.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pathfinding',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Krasser Pathfinder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int mode = 0;

  int b1 = 0;
  int b2 = 0;
  int b3 = 0;

  void _cycleMode() {
    setState(() {
      if (mode < 4) {
        mode++;
      } else {
        mode = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Row(
            children: [
              Column(children: [
                Container(
                    margin: EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                        onPressed: () => _cycleMode(),
                        child: Text("Mode : " + mode.toString()))),
              ]),
              Expanded(
                child: CustomScrollView(
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.all(20),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(25),
                            child: ElevatedButton(
                              child: Text(
                                b1.toString(),
                                style: TextStyle(fontSize: 20.0),
                              ),
                              onPressed: () {
                                setState(() {
                                  b1 = mode;
                                });
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(25),
                            child: ElevatedButton(
                              child: Text(
                                b2.toString(),
                                style: TextStyle(fontSize: 20.0),
                              ),
                              onPressed: () {
                                setState(() {
                                  b2 = mode;
                                });
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(25),
                            child: ElevatedButton(
                              child: Text(
                                b3.toString(),
                                style: TextStyle(fontSize: 20.0),
                              ),
                              onPressed: () {
                                setState(() {
                                  b3 = mode;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
