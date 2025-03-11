import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  /// Checks and requests location permission
  Future<bool> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.status;

    if (status.isDenied || status.isPermanentlyDenied) {
      status = await Permission.location.request();
    }

    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  /// Opens app settings if permission is permanently denied
  Future<void> openAppSettingsIfDenied() async {
    if (await Permission.location.isPermanentlyDenied) {
      await openAppSettings();
    }
  }
}
