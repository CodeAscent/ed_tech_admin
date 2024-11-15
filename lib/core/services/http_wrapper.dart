import 'dart:convert';
import 'package:ed_tech_admin/core/config/app_config.dart';
import 'package:ed_tech_admin/core/local/local_storage.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class HttpWrapper {
  static Future<Map<String, String>> headers() async {
    String? token = await LocalStorage.prefs.getString('token');
    if (token == null) {
      return {'content-type': "application/json"};
    }
    return {
      'content-type': "application/json",
      "Authorization": "Bearer $token"
    };
  }

  /// GET request
  static Future<http.Response> getRequest(String endpoint) async {
    try {
      final res = await http.get(Uri.parse(AppConfig.base_url + endpoint),
          headers: await headers());
      Logger().w(await headers());
      return res;
    } catch (e) {
      rethrow; // Rethrow to allow caller to handle
    }
  }

  /// POST request
  static Future<http.Response> postRequest(
      String endpoint, dynamic payload) async {
    try {
      final body = jsonEncode(payload);

      final res = await http.post(Uri.parse(AppConfig.base_url + endpoint),
          body: body, headers: await headers());
      return res;
    } catch (e) {
      rethrow; // Rethrow to allow caller to handle
    }
  }

   static commonResponse(
      {required http.Response res, required num statusCode}) async {
    final data = jsonDecode(res.body);
    if (res.statusCode == statusCode) {
      return data;
    } else {
      throw data['message'];
    }
  }
}
