import 'package:ed_tech_admin/core/utils/custom_constants.dart';
import 'package:ed_tech_admin/core/utils/custom_widgets.dart';
import 'package:ed_tech_admin/features/daysAndActivities/repo/days_repo.dart';
import 'package:ed_tech_admin/features/daysAndActivities/viewmodel/days_viewmodel.dart';
import 'package:ed_tech_admin/features/language/controller.dart/language_controller.dart';
import 'package:ed_tech_admin/features/language/controller.dart/language_switch.dart';
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
  final _enActivityInstructions = TextEditingController();
  final _enActivityName = TextEditingController();
  final _enActivityDescription = TextEditingController();
  final _hiActivityInstructions = TextEditingController();
  final _hiActivityName = TextEditingController();
  final _hiActivityDescription = TextEditingController();
  final _orActivityInstructions = TextEditingController();
  final _orActivityName = TextEditingController();
  final _orActivityDescription = TextEditingController();
  final dayId = Get.parameters['id'];
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LanguageController(),
        builder: (controller) {
          return Scaffold(
            appBar: KCommonAppBar(
              extraAction: LanguageSwitch(),
              title: 'Activities',
              onCreate: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    final _form = GlobalKey<FormState>();
                    return Form(
                      key: _form,
                      child: AlertDialog(
                        title: Text('Create Activity'),
                        content: SingleChildScrollView(
                          child: Wrap(
                            children: [
                              CustomTextFieldWithLabel(
                                  controller: _enActivityName,
                                  label: 'Activity Name',
                                  hintText: 'write an activity name'),
                              CustomTextFieldWithLabel(
                                  controller: _hiActivityName,
                                  label: 'गतिविधि का नाम',
                                  hintText: 'एक गतिविधि का नाम लिखें'),
                              CustomTextFieldWithLabel(
                                  controller: _orActivityName,
                                  label: 'କାର୍ଯ୍ୟକଳାପ ନାମ',
                                  hintText: 'ଏକ କାର୍ଯ୍ୟକଳାପ ନାମ ଲେଖନ୍ତୁ |'),
                              //
                              CustomTextFieldWithLabel(
                                  controller: _enActivityDescription,
                                  maxLines: 3,
                                  label: 'Activity Description',
                                  hintText: 'write activity description'),
                              CustomTextFieldWithLabel(
                                  controller: _hiActivityDescription,
                                  maxLines: 3,
                                  label: 'गतिविधि विवरण',
                                  hintText: 'गतिविधि विवरण लिखें'),
                              CustomTextFieldWithLabel(
                                  controller: _orActivityDescription,
                                  maxLines: 3,
                                  label: 'କାର୍ଯ୍ୟକଳାପ ବର୍ଣ୍ଣନା',
                                  hintText:
                                      'କାର୍ଯ୍ୟକଳାପ ଲେଖନ୍ତୁ ନିର୍ଦ୍ଦେଶାବଳୀ |'),

                              //
                              CustomTextFieldWithLabel(
                                  controller: _enActivityInstructions,
                                  maxLines: 6,
                                  label: 'Activity Instructions',
                                  hintText: 'write activity instructions'),
                              CustomTextFieldWithLabel(
                                  controller: _hiActivityInstructions,
                                  maxLines: 6,
                                  label: 'गतिविधि निर्देश',
                                  hintText: 'गतिविधि विवरण लिखें'),
                              CustomTextFieldWithLabel(
                                  controller: _orActivityInstructions,
                                  maxLines: 6,
                                  label: 'କାର୍ଯ୍ୟକଳାପ ନିର୍ଦ୍ଦେଶାବଳୀ',
                                  hintText:
                                      'କାର୍ଯ୍ୟକଳାପ ନିର୍ଦ୍ଦେଶାବଳୀ ଲେଖନ୍ତୁ |'),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('Cancel')),
                          TextButton(
                              onPressed: () async {
                                if (_form.currentState!.validate()) {
                                  Get.back();
                                  await daysViewmodel.createActivity(
                                      dayId: dayId!,
                                      enActivityName: _enActivityName.text,
                                      enActivityDescription:
                                          _enActivityDescription.text,
                                      enActivityInstructions:
                                          _enActivityInstructions.text,
                                      hiActivityName: _hiActivityName.text,
                                      hiActivityDescription:
                                          _hiActivityDescription.text,
                                      hiActivityInstructions:
                                          _hiActivityInstructions.text,
                                      orActivityName: _orActivityName.text,
                                      orActivityDescription:
                                          _orActivityDescription.text,
                                      orActivityInstructions:
                                          _orActivityInstructions.text);
                                  setState(() {});
                                }
                              },
                              child: Text('Ok')),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            body: FutureBuilder(
              future: daysViewmodel.getAllActivitiesByDayId(dayId: dayId!),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data['activities'].length != 0) {
                  return Wrap(
                    children: [
                      ...snapshot.data['activities'].map((e) {
                        return GestureDetector(
                          onTap: () {
                            // Get.toNamed('/days/activities/${e['_id']}/questions');
                            Get.toNamed('/days/activity/${e['_id']}');
                          },
                          child: Card(
                            child: SizedBox(
                              // height: 200,
                              // width: 400,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      // height: 150,
                                      // width: 400,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 20),
                                          Text(
                                            "${snapshot.data['activities'].indexOf(e) + 1}) ${e['activityName'][controller.currentLanguageCode]}",
                                            style: kCommonHeading(),
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            "${e['activityDescription'][controller.currentLanguageCode]}",
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
                                    // width: 400,
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
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
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
        });
  }
}
