import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static Future<bool> getPreferenceValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}
