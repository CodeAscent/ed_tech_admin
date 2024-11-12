import 'package:ed_tech_admin/core/utils/custom_constants.dart';
import 'package:ed_tech_admin/features/daysAndActivities/repo/days_repo.dart';
import 'package:ed_tech_admin/features/daysAndActivities/viewmodel/days_viewmodel.dart';
import 'package:ed_tech_admin/features/language/controller.dart/language_controller.dart';
import 'package:ed_tech_admin/features/language/controller.dart/language_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class ViewActivity extends StatefulWidget {
  const ViewActivity({super.key});

  @override
  State<ViewActivity> createState() => _ViewActivityState();
}

class _ViewActivityState extends State<ViewActivity> {
  final activityId = Get.parameters['id'];
  final daysViewmodel = DaysViewmodel(DaysRepo());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LanguageController(),
        builder: (controller) {
          return Scaffold(
            appBar: KCommonAppBar(
              title: 'Activity',
              actionLabel: 'Edit',
              extraAction: LanguageSwitch(),
            ),
            body: FutureBuilder(
              future: daysViewmodel.getActivityId(id: activityId!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final e = snapshot.data['activity'];
                  return Wrap(
                    children: [
                      Card(
                        child: SizedBox(
                          // height: 200,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Text(
                                      "${e['activityName'][controller.currentLanguageCode]}",
                                      style: kCommonHeading(),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "${e['activityDescription'][controller.currentLanguageCode]}",
                                      // style: kCommonHeading(),
                                    ),
                                    SizedBox(height: 20),
                                    HtmlWidget(
                                        '''${e['activityInstructions'][controller.currentLanguageCode]}''')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Center(
                  child: Text('Activity not found'),
                );
              },
            ),
          );
        });
  }
}
