import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'constant.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page One')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          ElevatedButton(onPressed: (){
            context.goNamed(RouterName.oneDetailPage);
          }, child: Text('Page One Details'))
        ]),
      ),
    );
  }
}