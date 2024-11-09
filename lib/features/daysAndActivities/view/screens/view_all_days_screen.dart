import 'package:ed_tech_admin/core/theme/app_colors.dart';
import 'package:ed_tech_admin/core/utils/custom_constants.dart';
import 'package:ed_tech_admin/core/utils/custom_widgets.dart';
import 'package:ed_tech_admin/features/daysAndActivities/repo/days_repo.dart';
import 'package:ed_tech_admin/features/daysAndActivities/viewmodel/days_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllDaysScreen extends StatefulWidget {
  const ViewAllDaysScreen({super.key});

  @override
  State<ViewAllDaysScreen> createState() => _ViewAllDaysScreenState();
}

class _ViewAllDaysScreenState extends State<ViewAllDaysScreen> {
  final daysViewmodel = DaysViewmodel(DaysRepo());
  final _dayCount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KCommonAppBar(
        title: 'Days',
        onCreate: () async {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Create Day'),
                content: Wrap(
                  children: [
                    CustomTextFieldWithLabel(
                        controller: _dayCount,
                        label: 'Day Number',
                        hintText: 'write day number')
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
                        await daysViewmodel.createDays(
                            dayNumber: _dayCount.text);
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
        future: daysViewmodel.getAllDays(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data['days'].length != 0) {
            return Wrap(
              children: [
                ...snapshot.data['days'].map((e) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/days/${e['_id']}/activities/all');
                    },
                    child: Card(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                              width: 100,
                              child: Center(
                                child: Text(
                                  "DAY ${e['dayNumber']}",
                                  style: kCommonHeading(),
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.red,
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
            child: Text('No Days Created'),
          );
        },
      ),
    );
  }
}
