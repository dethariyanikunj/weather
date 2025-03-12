import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import './location_model.dart';

/// Service to handle location-related operations
class LocationServiceHelper {
  /// Checks and requests location permission
  Future<bool> _handleLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  /// Prompts user to enable location services if disabled
  Future<bool> checkAndRequestLocationServices() async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      return await Geolocator.openLocationSettings(); // Opens system settings to enable GPS
    }
    return true;
  }

  /// Gets the user's current location
  Future<LocationModel?> getCurrentLocation() async {
    bool hasPermission = await _handleLocationPermission();
    if (!hasPermission) return null;

    bool isEnabled = await checkAndRequestLocationServices();
    if (!isEnabled) return null; // User did not enable location

    LocationSettings locationSettings;

    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        forceLocationManager: false,
        timeLimit: const Duration(seconds: 10),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 10),
      );
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );

    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  /// Checks if location services are enabled
  Future<bool> isLocationEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }
}