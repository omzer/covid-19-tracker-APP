import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  // Singleton
  static Prefs _prefs;

  static Prefs getInstance() {
    return _prefs ?? (_prefs = Prefs());
  }

  // Keys
  final String _KEY_CITY = 'CITY';

  // Default values
  final String _DEFAULT_CITY = 'Jerusalem';

  // Main reference
  SharedPreferences _sharedPreferences;

  Future<void> initSharedPrefs() async {
    if (_sharedPreferences == null)
      _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> updateCity(String city) async {
    return _sharedPreferences.setString(_KEY_CITY, city);
  }

  String getCity() {
    return _sharedPreferences.getString(_KEY_CITY) ?? _DEFAULT_CITY;
  }
}
