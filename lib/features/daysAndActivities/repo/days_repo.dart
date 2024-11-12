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
    required String enActivityName,
    required String enActivityDescription,
    required String enActivityInstructions,
    required String hiActivityName,
    required String hiActivityDescription,
    required String hiActivityInstructions,
    required String orActivityName,
    required String orActivityDescription,
    required String orActivityInstructions,
  }) async {
    try {
      final res = await HttpWrapper.postRequest('days/create-activity/$dayId', {
        "activityName": {
          "en": enActivityInstructions,
          "hi": hiActivityInstructions,
          "or": orActivityInstructions
        },
        "activityDescription": {
          "en": enActivityDescription,
          "hi": hiActivityDescription,
          "or": orActivityDescription
        },
        "activityInstructions": {
          "en": enActivityInstructions,
          "hi": hiActivityInstructions,
          "or": orActivityInstructions
        }
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

  Future getAllActivityId({required String id}) async {
    try {
      final res = await HttpWrapper.getRequest('days/activity/$id');
      return HttpWrapper.commonResponse(res: res, statusCode: 200);
    } catch (e) {
      rethrow;
    }
  }
}
