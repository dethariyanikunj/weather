import 'dart:ui';

import 'package:get/get.dart';

import '../../data/models/weather_info.dart';
import '../../utils/app_utils.dart';

class HistoryController extends GetxController {
  Rxn<WeatherInfo> weatherInfo = Rxn<WeatherInfo>();

  @override
  void onInit() {
    _getWeatherHistory();
    super.onInit();
  }

  Future _getWeatherHistory() async {
    weatherInfo.value = await PrefUtils.getWeatherInfo();
  }

  Color getBgColorsFromWeatherType() {
    return weatherInfo.value?.getBgColorsFromWeatherType() ??
        AppColors.colorUnknown;
  }

  String getAssetPathFromWeatherType() {
    return weatherInfo.value?.getAssetPathFromWeatherType() ??
        AppAssets.icUnknown;
  }
}
