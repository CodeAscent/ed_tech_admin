import 'package:ed_tech_admin/core/utils/custom_constants.dart';
import 'package:flutter/material.dart';

class ViewAllQuestionsScreen extends StatefulWidget {
  const ViewAllQuestionsScreen({super.key});

  @override
  State<ViewAllQuestionsScreen> createState() => _ViewAllQuestionsScreenState();
}

class _ViewAllQuestionsScreenState extends State<ViewAllQuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KCommonAppBar(title: 'Question'),
    );
  }
}
