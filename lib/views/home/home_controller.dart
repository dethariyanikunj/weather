import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../api/api.dart';
import '../../api/responses/weather_api_response.dart';
import '../../data/envs/weather_type.dart';
import '../../data/models/weather_info.dart';
import '../../localizations/language_keys.dart';
import '../../utils/app_utils.dart';
import '../../utils/location_service/location_model.dart';
import '../../utils/location_service/location_permission.dart';
import '../../utils/location_service/location_service_helper.dart';
import '../../widgets/app_widget.dart';

class HomeController extends GetxController {
  final TextEditingController cityTextEditingController =
      TextEditingController();
  final FocusNode cityFocusNode = FocusNode();
  LocationModel? locationInfo;
  Rxn<WeatherInfo> weatherInfo = Rxn<WeatherInfo>();
  RxString unknownWeatherInfoMessage = ''.obs;

  @override
  void onInit() {
    // Network connectivity check
    ConnectivityManager.instance.setConnectivityListener();
    _checkForLocationPermission();
    super.onInit();
  }

  Future _checkForLocationPermission() async {
    final permission = await PermissionService().requestLocationPermission();
    if (permission) {
      _fetchUsersCurrentLocation();
    }
  }

  Future<void> _fetchUsersCurrentLocation() async {
    LocationServiceHelper locationService = LocationServiceHelper();

    // Check and request location services if disabled
    bool isEnabled = await locationService.checkAndRequestLocationServices();
    if (!isEnabled) {
      AppToastView.showErrorToast(
        message: LanguageKey.locationServiceDisabled.tr,
      );
      return;
    }
    // Fetch user's current location
    LocationModel? location = await locationService.getCurrentLocation();
    if (location != null) {
      await _fetchCurrentWeatherThroughLocation(
        location.latitude,
        location.longitude,
      );
    } else {
      AppToastView.showErrorToast(
        message: LanguageKey.locationPermissionDeniedMessage.tr,
      );
    }
  }

  /// Call APIs to get weather information
  /// Ref. https://www.weatherapi.com/docs/
  Future _fetchCurrentWeatherThroughLocation(
    double latitude,
    double longitude,
  ) async {
    AppProgressDialog.show();
    final response =
        await ApiServiceConfig.apiService.getRequest<WeatherApiResponse>(
      ApiEndpoints.currentWeather,
      queryParams: {
        'key': dotenv.get('WEATHER_API_KEY'),
        'q': '$latitude,$longitude',
      },
      fromJson: (data) => WeatherApiResponse.fromJson(data),
    );
    if (response.isSuccess) {
      _bindWeatherInformation(response.data);
    } else {
      weatherInfo.value = null;
      unknownWeatherInfoMessage.value =
          response.error?.message ?? LanguageKey.oopsSomethingWentWrong.tr;
      AppToastView.showErrorToast(
        message: response.error?.message,
      );
    }
    AppProgressDialog.hide();
  }

  Future fetchCurrentWeatherThroughCity(String city) async {
    AppProgressDialog.show();
    final response =
        await ApiServiceConfig.apiService.getRequest<WeatherApiResponse>(
      ApiEndpoints.currentWeather,
      queryParams: {
        'key': dotenv.get('WEATHER_API_KEY'),
        'q': city.trim(),
      },
      fromJson: (data) => WeatherApiResponse.fromJson(data),
    );
    if (response.isSuccess) {
      _bindWeatherInformation(response.data);
    } else {
      weatherInfo.value = null;
      unknownWeatherInfoMessage.value =
          response.error?.message ?? LanguageKey.oopsSomethingWentWrong.tr;
      AppToastView.showErrorToast(
        message: response.error?.message,
      );
    }
    AppProgressDialog.hide();
  }

  void _bindWeatherInformation(WeatherApiResponse? weatherData) {
    if (weatherData != null) {
      final StringBuffer locationStringBuffer = StringBuffer();
      final locationName = weatherData.location?.name?.trim();
      final locationRegion = weatherData.location?.region?.trim();
      final locationCountry = weatherData.location?.country?.trim();
      if (locationName != null && locationName.isNotEmpty) {
        locationStringBuffer.write(locationName);
      }
      if (locationRegion != null && locationRegion.isNotEmpty) {
        if (locationStringBuffer.isNotEmpty) {
          locationStringBuffer.write(',');
          locationStringBuffer.write(' ');
        }
        locationStringBuffer.write(locationRegion);
      }
      if (locationCountry != null && locationCountry.isNotEmpty) {
        if (locationStringBuffer.isNotEmpty) {
          locationStringBuffer.write(',');
          locationStringBuffer.write(' ');
        }
        locationStringBuffer.write(locationCountry);
      }
      weatherInfo.value = WeatherInfo(
        latitude: weatherData.location?.lat,
        longitude: weatherData.location?.lon,
        address: locationStringBuffer.toString().trim(),
        weatherType: getWeatherType(
          weatherData.current?.condition?.code,
          weatherData.current?.isDay != 1,
        ),
        inCelsius: weatherData.current?.tempC,
        inFahrenheit: weatherData.current?.tempF,
        weatherCondition: weatherData.current?.condition?.text,
      );
      PrefUtils.saveWeatherInfo(weatherInfo.value!);
    }
  }

  WeatherType getWeatherType(int? conditionCode, bool isNight) {
    if (conditionCode != null) {
      return WeatherType.fromCode(conditionCode, isNight);
    }
    return WeatherType.unknown;
  }

  Color getBgColorsFromWeatherType() {
    return weatherInfo.value?.getBgColorsFromWeatherType() ??
        AppColors.colorUnknown;
  }

  String getAssetPathFromWeatherType() {
    return weatherInfo.value?.getAssetPathFromWeatherType() ??
        AppAssets.icUnknown;
  }

  void navigateToWeatherHistory() {
    Get.toNamed(AppRoutes.historyPage);
  }

  @override
  void onClose() {
    cityFocusNode.dispose();
    cityTextEditingController.dispose();
    super.onClose();
  }
}
