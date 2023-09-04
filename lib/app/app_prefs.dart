import 'package:shared_preferences/shared_preferences.dart';

class LanguagePreferences {
  static LanguagePreferences? _instance;
  static SharedPreferences? _prefs;

  LanguagePreferences._(); // Private constructor

  static Future<LanguagePreferences?> getInstance() async {
    if (_instance == null) {
      _instance = LanguagePreferences._();
      await _instance!._init();
    }
    return _instance;
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setLanguage(String language) async {
    if (_prefs != null) {
      await _prefs!.setString('selected_language', language);
    }
  }

  Future<String?> getAppLanguage() async {
    if (_prefs != null) {
      return _prefs!.getString('selected_language');
    }
    return null;
  }
}
