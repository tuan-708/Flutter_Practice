import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth/auth_service.dart';
import 'package:flutter_application_2/pages/add_telescop_page.dart';
import 'package:flutter_application_2/pages/brand_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/view_telescope_page.dart';
import 'package:flutter_application_2/providers/telescope_peovider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'pages/dashboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => TelescopeProvider(),
      ),
      
    ],
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      builder: EasyLoading.init(),
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    initialLocation: DashBoardPage.routerName,
    redirect: (context, state) {
      if (AuthService.currentUser == null) {
        return LoginPage.routerName;
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(
          name: DashBoardPage.routerName,
          path: DashBoardPage.routerName,
          builder: (context, state) => const DashBoardPage(),
          routes: [
            GoRoute(
              name: AddTelescopePage.routerName,
              path: AddTelescopePage.routerName,
              builder: (context, state) => const AddTelescopePage(),
            ),
            GoRoute(
              name: ViewTelescopePage.routerName,
              path: ViewTelescopePage.routerName,
              builder: (context, state) => const ViewTelescopePage(),
            ),

            GoRoute(
              name: BrandPage.routerName,
              path: BrandPage.routerName,
              builder: (context, state) => const BrandPage(),
            ),
          ]),
      GoRoute(
        name: LoginPage.routerName,
        path: LoginPage.routerName,
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}
