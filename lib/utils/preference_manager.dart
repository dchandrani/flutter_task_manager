import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class PreferenceManager {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveApiKey(key) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setString('apiKey', key);
  }

  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await _prefs;

    final String key = prefs.getString( 'apiKey') ?? '';

    return key == '' ? false : true;
  }

  logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('apiKey', '');
  }
}
