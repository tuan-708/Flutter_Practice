import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(1000, (index) => 'Item ${index + 1}');

    return Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
        appBar: AppBar(
          title: Text('List View Example'),
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) => ListTile(
            title: Text('Item ${index + 1}'),
            subtitle: Text('This is a subtitle ${index + 1}'),
          ),
        ));
  }
}
