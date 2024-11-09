import 'package:ed_tech_admin/features/dashboard/view/screens/dashboard.dart';
import 'package:ed_tech_admin/features/daysAndActivities/view/screens/view_all_activities_in_day_screen.dart';
import 'package:ed_tech_admin/features/daysAndActivities/view/screens/view_all_days_screen.dart';
import 'package:ed_tech_admin/features/daysAndActivities/view/screens/view_all_questions_in_activity.dart';
import 'package:ed_tech_admin/features/questions/view/screens/view_all_questions_screen.dart';
import 'package:ed_tech_admin/features/questions/view/screens/view_question_screen.dart';
import 'package:ed_tech_admin/features/users/view/screens/view_all_users_screen.dart';
import 'package:ed_tech_admin/features/users/view/screens/view_user_screen.dart';
import 'package:get/get.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: '/',
    page: () => DashboardScreen(),
  ),
  GetPage(
    name: '/users/all',
    page: () => ViewAllUsersScreen(),
  ),
  GetPage(
    name: '/users/:id',
    page: () => ViewUserScreen(),
  ),
  GetPage(
    name: '/questions/all',
    page: () => ViewAllQuestionsScreen(),
  ),
  GetPage(
    name: '/questions/:id',
    page: () => ViewQuestionScreen(),
  ),
  GetPage(
    name: '/days/all',
    page: () => ViewAllDaysScreen(),
  ),
  GetPage(
    name: '/days/:id/activities/all',
    page: () => ViewAllActivitiesInDayScreen(),
  ),
  GetPage(
    name: '/days/activities/:id/questions',
    page: () => ViewAllQuestionsInActivity(),
  ),
];
