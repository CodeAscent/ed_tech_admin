import 'package:ed_tech_admin/core/utils/custom_constants.dart';
import 'package:ed_tech_admin/core/utils/custom_widgets.dart';
import 'package:ed_tech_admin/features/daysAndActivities/repo/days_repo.dart';
import 'package:ed_tech_admin/features/daysAndActivities/viewmodel/days_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllActivitiesInDayScreen extends StatefulWidget {
  const ViewAllActivitiesInDayScreen({super.key});

  @override
  State<ViewAllActivitiesInDayScreen> createState() =>
      _ViewAllActivitiesInDayScreenState();
}

class _ViewAllActivitiesInDayScreenState
    extends State<ViewAllActivitiesInDayScreen> {
  final daysViewmodel = DaysViewmodel(DaysRepo());
  final _activityInstructions = TextEditingController();
  final _activityName = TextEditingController();
  final _activityDescription = TextEditingController();
  final dayId = Get.parameters['id'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KCommonAppBar(
        title: 'Activities',
        onCreate: () async {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Create Activity'),
                content: Wrap(
                  children: [
                    CustomTextFieldWithLabel(
                        controller: _activityName,
                        label: 'Activity Name',
                        hintText: 'write an activity name'),
                    CustomTextFieldWithLabel(
                        controller: _activityDescription,
                        maxLines: 3,
                        label: 'Activity Description',
                        hintText: 'write activity description'),
                    CustomTextFieldWithLabel(
                        controller: _activityInstructions,
                        maxLines: 10,
                        label: 'Activity Description',
                        hintText: 'write activity Instructions')
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Cancel')),
                  TextButton(
                      onPressed: () async {
                        Get.back();
                        await daysViewmodel.createActivity(
                            dayId: dayId!,
                            activityName: _activityName.text,
                            activityDescription: _activityDescription.text,
                            activityInstructions: _activityInstructions.text);
                        setState(() {});
                      },
                      child: Text('Ok')),
                ],
              );
            },
          );
        },
      ),
      body: FutureBuilder(
        future: daysViewmodel.getAllActivitiesByDayId(dayId: dayId!),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data['activities'].length != 0) {
            return Wrap(
              children: [
                ...snapshot.data['activities'].map((e) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/days/activities/${e['_id']}/questions');
                    },
                    child: Card(
                      child: SizedBox(
                        height: 200,
                        width: 400,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                height: 150,
                                width: 400,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Text(
                                      "${snapshot.data['activities'].indexOf(e) + 1}) ${e['activityName']}",
                                      style: kCommonHeading(),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "${e['activityDescription']}",
                                      // style: kCommonHeading(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 400,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Text('No Activities Created'),
          );
        },
      ),
    );
  }
}
