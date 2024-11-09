import 'package:ed_tech_admin/core/utils/custom_constants.dart';
import 'package:flutter/material.dart';

class ViewAllUsersScreen extends StatefulWidget {
  const ViewAllUsersScreen({super.key});

  @override
  State<ViewAllUsersScreen> createState() => _ViewAllUsersScreenState();
}

class _ViewAllUsersScreenState extends State<ViewAllUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: KCommonAppBar(title: 'Users'),

    );
  }
}