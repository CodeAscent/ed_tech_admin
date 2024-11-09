import 'package:ed_tech_admin/core/utils/custom_constants.dart';
import 'package:flutter/material.dart';

class ViewAllQuestionsInActivity extends StatefulWidget {
  const ViewAllQuestionsInActivity({super.key});

  @override
  State<ViewAllQuestionsInActivity> createState() => _ViewAllQuestionsInActivityState();
}

class _ViewAllQuestionsInActivityState extends State<ViewAllQuestionsInActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: KCommonAppBar(title: 'Questions'),

    );
  }
}