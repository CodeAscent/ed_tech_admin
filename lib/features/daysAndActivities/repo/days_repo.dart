import 'package:ed_tech_admin/core/services/http_wrapper.dart';

class DaysRepo {
  Future createDay({required String dayNumber}) async {
    try {
      final res = await HttpWrapper.postRequest(
          'days/create-day', {"dayNumber": num.parse(dayNumber)});
      return HttpWrapper.commonResponse(res: res, statusCode: 200);
    } catch (e) {
      rethrow;
    }
  }

  Future createActivity({
    required String dayId,
    required String activityName,
    required String activityDescription,
    required String activityInstructions,
  }) async {
    try {
      final res = await HttpWrapper.postRequest('days/create-activity/$dayId', {
        "activityName": activityName,
        "activityDescription": activityDescription,
        "activityInstructions": activityInstructions
      });
      return HttpWrapper.commonResponse(res: res, statusCode: 200);
    } catch (e) {
      rethrow;
    }
  }

  Future getAllDays() async {
    try {
      final res = await HttpWrapper.getRequest('days/all-days');
      return HttpWrapper.commonResponse(res: res, statusCode: 200);
    } catch (e) {
      rethrow;
    }
  }

  Future getAllActivitiesByDayId({required String id}) async {
    try {
      final res = await HttpWrapper.getRequest('days/all-activities/$id');
      return HttpWrapper.commonResponse(res: res, statusCode: 200);
    } catch (e) {
      rethrow;
    }
  }
}
