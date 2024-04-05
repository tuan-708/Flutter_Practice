import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  final String? greetings;
  const PageTwo({super.key, this.greetings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page One')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Text('${greetings}')
        ]),
      ),
    );
  }
}