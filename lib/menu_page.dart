import 'package:flutter/material.dart';
import 'package:flutter_application_2/home_page.dart';
import 'package:flutter_application_2/input_widget.dart';
import 'package:flutter_application_2/todo_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Page'),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: (){Navigator.push(context, 
              MaterialPageRoute(builder: (context) => HomePage()));}, 
              child: Text('Go Home Page')),
            ElevatedButton(
              onPressed: (){Navigator.push(context, 
              MaterialPageRoute(builder: (context) => InputWidgetPage()));}, 
              child: Text('Go InputWidget')),
            ElevatedButton(
              onPressed: (){Navigator.push(context, 
              MaterialPageRoute(builder: (context) => TodoPage()));}, 
              child: Text('Go Todos Page')),
          ],
        ),
      ),
    );
  }
}