import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static void setStringValue(String key, ThemeMode value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value.name);
  }

  static Future<String?> getStringValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
