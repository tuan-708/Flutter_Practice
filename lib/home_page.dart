import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ElevatedButton(
              onPressed: () {
                // context.goNamed(RouterName.profilePage, 
                //   pathParameters: {'ids': '123'});
                  context.goNamed(RouterName.profilePage, 
                  pathParameters: {'id': '123'});
              },
              child: Text('Profile')),
          ElevatedButton(
              onPressed: () {
                context.goNamed(RouterName.onePage);
              },
              child: Text('Page One')),
          ElevatedButton(
              onPressed: () {
                context.goNamed(RouterName.twoPage, extra: 'Hello Flutter');
              },
              child: Text('Page Two')),
        ]),
      ),
    );
  }
}
