import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('You have pushed the button this many times:'),
          Text(
            '$counter',
            style: TextStyle(fontSize: 50),
          )
        ]),
      ),
    );
  }
}