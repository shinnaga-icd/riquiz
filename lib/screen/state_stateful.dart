import 'package:flutter/material.dart';

// StatefulWidgetをextends
class StateStateful extends StatefulWidget {
  const StateStateful({Key? key}) : super(key: key);

  // createStateを実装
  @override
  State<StatefulWidget> createState() => _StateStateful();
}

// createState用にclassを実装
class _StateStateful extends State<StateStateful> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateful")),
      body: Text("$_counter"),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
