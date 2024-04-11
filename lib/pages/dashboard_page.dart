import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth/auth_service.dart';
import 'package:flutter_application_2/customwidgets/dashboard_item_view.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/providers/telescope_peovider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/dashboard_model.dart';

class DashBoardPage extends StatefulWidget {
  static const String routerName = '/';
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  @override
  void didChangeDependencies() {
    Provider.of<TelescopeProvider>(context, listen: false).getAllBrands();
    Provider.of<TelescopeProvider>(context, listen: false).getAllTelescope();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DashBoard Page'),
          actions: [
            IconButton(
              onPressed: () {
                AuthService.logout().then((value) => GoRouter.of(context).goNamed(LoginPage.routerName));
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: dashboardModelList.length,
          itemBuilder: (context, index) {
            final model  = dashboardModelList[index];
            return DashboardItemView(
              model: model, 
              onPress: (value){
                context.goNamed(value);
            });
          },
        ));
  }
}
