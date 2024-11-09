import 'package:ed_tech_admin/core/utils/custom_constants.dart';
import 'package:flutter/material.dart';

class ViewQuestionScreen extends StatefulWidget {
  const ViewQuestionScreen({super.key});

  @override
  State<ViewQuestionScreen> createState() => _ViewQuestionScreenState();
}

class _ViewQuestionScreenState extends State<ViewQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KCommonAppBar(title: ''),
    );
  }
}
