import 'package:flutter/material.dart';
import 'package:flutter_application_2/error_page.dart';
import 'package:flutter_application_2/home_page.dart';
import 'package:flutter_application_2/page_one.dart';
import 'package:flutter_application_2/page_two.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'page_one_details.dart';
import 'constant.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    initialLocation: '/', 
    debugLogDiagnostics: true,
    errorBuilder: (context, state)  => const ErrorPage(),
    routes: [
    GoRoute(
        name: RouterName.homePage,
        path: '/',
        builder: (context, state) => const HomePage()),
    GoRoute(
        name: RouterName.onePage,
        path: '/page_one',
        builder: (context, state) => const PageOne(),
        routes: [
          GoRoute(
              name: RouterName.oneDetailPage,
              path: 'one_details',
              builder: (context, state) => const PageOneDetail()),
        ]),
    GoRoute(
        name: RouterName.twoPage,
        path: '/page_two',
        builder: (context, state) {
          final msg = state.extra! as String;
          return PageTwo(
            greetings: msg,
          );
        }),
    GoRoute(
        name: RouterName.profilePage,
        path: '/profile/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return PageProfile(id: int.parse(id));
        }),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter demo',
      routerConfig: _router,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, brightness: Brightness.light),
          useMaterial3: true),
      builder: EasyLoading.init(),
    );
  }
}
