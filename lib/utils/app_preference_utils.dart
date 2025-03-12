import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/weather_info.dart';

class PrefUtils {
  static const String _weatherKey = "weather_info";
  static SharedPreferences? _sharedPreferences;

  Future init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  /// Save `WeatherInfo` to SharedPreferences
  static Future<void> saveWeatherInfo(WeatherInfo weatherInfo) async {
    String weatherJson = jsonEncode(weatherInfo.toJson());
    await _sharedPreferences?.setString(_weatherKey, weatherJson);
  }

  /// Retrieve `WeatherInfo` from SharedPreferences
  static Future<WeatherInfo?> getWeatherInfo() async {
    String? weatherJson = _sharedPreferences?.getString(_weatherKey);
    if (weatherJson != null) {
      Map<String, dynamic> jsonData = jsonDecode(weatherJson);
      return WeatherInfo.fromJson(jsonData);
    }
    return null;
  }

  /// Clear stored weather info
  static Future<void> clearWeatherInfo() async {
    await _sharedPreferences?.remove(_weatherKey);
  }
}
