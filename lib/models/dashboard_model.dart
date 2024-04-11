import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/add_telescop_page.dart';
import 'package:flutter_application_2/pages/view_telescope_page.dart';
import 'package:flutter_application_2/pages/brand_page.dart';

class DashboardModel{
  final String title;
  final IconData iconData;
  final String routerName;

  DashboardModel({
    required this.title,
    required this.iconData,
    required this.routerName,
  });
}

List<DashboardModel> dashboardModelList = [
  DashboardModel(title: 'Add Telescopes',iconData: Icons.add,routerName: AddTelescopePage.routerName,),
  DashboardModel(title: 'View Telescopes',iconData: Icons.inventory,routerName: ViewTelescopePage.routerName,),
  DashboardModel(title: 'Brands',iconData: Icons.category ,routerName: BrandPage.routerName,)
];