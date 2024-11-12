import 'package:ed_tech_admin/features/language/controller.dart/language_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Get.find<LanguageController>();
    return GetBuilder<LanguageController>(builder: (controller) {
      return PopupMenuButton(
        icon: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Language ~ ${controller.currentLanguage}',
                style: TextStyle(
                    fontWeight: FontWeight.w900, color: Colors.black)),
          ),
        ),
        itemBuilder: (context) {
          return languageController.availableLanguages.entries
              .map((e) => PopupMenuItem(
                  onTap: () {
                    languageController.updateLanguage(e.value);
                  },
                  child: Text(
                    e.value,
                  )))
              .toList();
        },
      );
    });
  }
}
