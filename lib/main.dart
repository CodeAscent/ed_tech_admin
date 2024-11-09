import 'package:ed_tech_admin/core/local/local_storage.dart';
import 'package:ed_tech_admin/core/routes/app_routes.dart';
import 'package:ed_tech_admin/core/theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        title: "Ed Tech Admin",
        theme: AppTheme.lightTheme(),
        getPages: appRoutes,
        initialRoute: '/',
      ),
    );
  }
}
