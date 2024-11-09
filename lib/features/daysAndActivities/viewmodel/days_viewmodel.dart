import 'package:ed_tech_admin/core/utils/custom_snackbar.dart';
import 'package:ed_tech_admin/features/daysAndActivities/repo/days_repo.dart';

class DaysViewmodel {
  final DaysRepo daysRepo;

  DaysViewmodel(this.daysRepo);

  Future createDays({required String dayNumber}) async {
    try {
      final res = await daysRepo.createDay(dayNumber: dayNumber);
      if (res != null) {
        customSnackbar(res['message'], ContentType.success);
        return res['data'];
      }
    } catch (e) {
      customSnackbar(e.toString(), ContentType.failure);
    }
  }

  Future createActivity(
      {required String dayId,
      required String activityName,
      required String activityDescription,
      required String activityInstructions}) async {
    try {
      final res = await daysRepo.createActivity(
          dayId: dayId,
          activityName: activityName,
          activityDescription: activityDescription,
          activityInstructions: activityInstructions);
      if (res != null) {
        customSnackbar(res['message'], ContentType.success);
        return res['data'];
      }
    } catch (e) {
      customSnackbar(e.toString(), ContentType.failure);
    }
  }

  Future getAllDays() async {
    try {
      final res = await daysRepo.getAllDays();
      if (res != null) {
        return res['data'];
      }
      return null;
    } catch (e) {
      customSnackbar(e.toString(), ContentType.failure);
    }
  }

  Future getAllActivitiesByDayId({required String dayId}) async {
    try {
      final res = await daysRepo.getAllActivitiesByDayId(id: dayId);
      if (res != null) {
        return res['data'];
      }
      return null;
    } catch (e) {
      customSnackbar(e.toString(), ContentType.failure);
    }
  }
}
