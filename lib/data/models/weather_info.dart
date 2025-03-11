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
}
