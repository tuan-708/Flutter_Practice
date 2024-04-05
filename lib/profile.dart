import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'constant.dart';

class PageProfile extends StatelessWidget {

  final int id;
  const PageProfile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Profile')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${id}'),
             ElevatedButton(
              onPressed: () {
                context.goNamed(RouterName.homePage);
              },
              child: Text('Page One')),
        ]),
      ),
    );
  }
}