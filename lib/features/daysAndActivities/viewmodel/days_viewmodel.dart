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
      final res = await daysRepo.createActivity(dayId: dayId, enActivityName: enActivityName, enActivityDescription: enActivityDescription, enActivityInstructions: enActivityInstructions, hiActivityName: hiActivityName, hiActivityDescription: hiActivityDescription, hiActivityInstructions: hiActivityInstructions, orActivityName: orActivityName, orActivityDescription: orActivityDescription, orActivityInstructions: orActivityInstructions);
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

  Future getActivityId({required String id}) async {
    try {
      final res = await daysRepo.getAllActivityId(id: id);
      if (res != null) {
        return res['data'];
      }
      return null;
    } catch (e) {
      customSnackbar(e.toString(), ContentType.failure);
    }
  }
}
