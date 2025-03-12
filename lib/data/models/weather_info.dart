import 'dart:ui';

import '../../utils/app_utils.dart';
import '../envs/weather_type.dart';

class WeatherInfo {
  const WeatherInfo({
    required this.weatherType,
    required this.inCelsius,
    required this.inFahrenheit,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.weatherCondition,
  });

  final WeatherType? weatherType;
  final double? inCelsius;
  final double? inFahrenheit;
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? weatherCondition;

  /// Convert object to JSON for storing in SharedPreferences
  Map<String, dynamic> toJson() {
    return {
      'weatherType': weatherType?.index, // Store enum as index
      'inCelsius': inCelsius,
      'inFahrenheit': inFahrenheit,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'weatherCondition': weatherCondition,
    };
  }

  /// Convert JSON to `WeatherInfo` object
  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      weatherType: json['weatherType'] != null
          ? WeatherType.values[json['weatherType']]
          : null,
      inCelsius: (json['inCelsius'] as num?)?.toDouble(),
      inFahrenheit: (json['inFahrenheit'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'],
      weatherCondition: json['weatherCondition'],
    );
  }

  Color getBgColorsFromWeatherType() {
    if (weatherType == WeatherType.clearNight) {
      return AppColors.colorBlack;
    } else if (weatherType == WeatherType.sunny) {
      return AppColors.colorSunny;
    } else if (weatherType == WeatherType.rainy) {
      return AppColors.colorRainy;
    } else if (weatherType == WeatherType.cloudy) {
      return AppColors.colorCloudy;
    } else if (weatherType == WeatherType.snowy) {
      return AppColors.colorSnowy;
    }
    return AppColors.colorUnknown;
  }

  String getAssetPathFromWeatherType() {
    if (weatherType == WeatherType.clearNight) {
      return AppAssets.icClearNight;
    } else if (weatherType == WeatherType.sunny) {
      return AppAssets.icSunny;
    } else if (weatherType == WeatherType.rainy) {
      return AppAssets.icRainy;
    } else if (weatherType == WeatherType.cloudy) {
      return AppAssets.icCloudy;
    } else if (weatherType == WeatherType.snowy) {
      return AppAssets.icSnowy;
    }
    return AppAssets.icUnknown;
  }
}
