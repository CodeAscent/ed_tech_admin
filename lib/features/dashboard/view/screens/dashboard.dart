import 'package:ed_tech_admin/core/utils/custom_constants.dart';
import 'package:ed_tech_admin/features/dashboard/models/dashboard_items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    List<DashboardItemsModel> items = [
      DashboardItemsModel(name: 'Users', icon: 'users', route: 'users/all'),
      DashboardItemsModel(
          name: 'Day & Activity', icon: 'dayAndActivity', route: 'days/all'),
      DashboardItemsModel(
          name: 'Questions', icon: 'questions', route: 'questions/all'),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: OverflowBar(
            spacing: 10,
            overflowAlignment: OverflowBarAlignment.center,
            alignment: MainAxisAlignment.center,
            children: [
              ...items.map(
                (e) => kCommonCard(icon: e.icon, route: e.route, label: e.name),
              )
            ],
          ),
        ),
      ),
    );
  }

  kCommonCard(
      {required String icon, required String route, required String label}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(route);
      },
      child: Container(
        height: 200,
        width: 200,
        child: Card(
          color: randomColor(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/$icon.png',
                height: 70,
                width: 70,
              ),
              SizedBox(height: 20),
              Text(
                label,
                style: kCommonHeading(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
