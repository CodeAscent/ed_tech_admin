import 'package:get/get.dart';

class LanguageController extends GetxController {
  Map<String, dynamic> availableLanguages = {
    "en": "English",
    "hi": "Hindi",
    "or": "Oriya"
  };

  String currentLanguageCode = 'en';
  String currentLanguage = 'English';
  updateLanguage(String newLanguage) {
    for (var lang in availableLanguages.entries) {
      if (lang.value == newLanguage) {
        currentLanguage = lang.value;
        currentLanguageCode = lang.key;
        update();
      }
    }
  }
}
