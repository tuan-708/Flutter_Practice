import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: GridViewExample()));
}

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

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(100, (index) => 'Item ${index + 1}');

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: Text('Grid View Example'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2, childAspectRatio: 0.7),
        itemCount: items.length,
        itemBuilder: (context, index) => Card(
          child: Center(
            child: Text(items[index]),
          ),
        ),
      ),
    );
  }
}
