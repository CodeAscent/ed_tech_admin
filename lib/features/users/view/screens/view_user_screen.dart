import 'package:ed_tech_admin/core/utils/custom_constants.dart';
import 'package:flutter/material.dart';

class ViewUserScreen extends StatefulWidget {
  const ViewUserScreen({super.key});

  @override
  State<ViewUserScreen> createState() => _ViewUserScreenState();
}

class _ViewUserScreenState extends State<ViewUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KCommonAppBar(title: 'User'),
    );
  }
}
