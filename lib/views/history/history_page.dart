import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../localizations/language_keys.dart';
import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';
import './history_controller.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({
    super.key,
  });

  Color _getWidgetColor() {
    return AppColors.colorBlack;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appBarWidget(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: AppDimens.dimensScreenHorizontalMargin.w,
                  right: AppDimens.dimensScreenHorizontalMargin.w,
                  top: AppDimens.dimens20.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _verticalSpacing30(),
                    _weatherDetailsWidget(),
                    _verticalSpacing15(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _horizontalSpacing10() {
    return SizedBox(
      width: AppDimens.dimens10.w,
    );
  }

  Widget _verticalSpacing15() {
    return SizedBox(
      height: AppDimens.dimens15.h,
    );
  }

  Widget _verticalSpacing30() {
    return SizedBox(
      height: AppDimens.dimens30.h,
    );
  }

  Widget _appBarWidget() {
    return AppScreenTitleBar(
      title: LanguageKey.history.tr.toUpperCase(),
      actionWidget: _historyWidget(),
    );
  }

  Widget _historyWidget() {
    return AppImageView(
      imagePath: AppAssets.icHistory,
      width: AppDimens.dimens25.w,
      height: AppDimens.dimens25.h,
    );
  }

  Widget _weatherDetailsWidget() {
    return Obx(() {
      final isWeatherInfoAvailable = controller.weatherInfo.value != null;
      return isWeatherInfoAvailable
          ? Column(
              children: [
                _weatherIconWidget(),
                _verticalSpacing15(),
                _weatherConditionWidget(),
                _verticalSpacing15(),
                _weatherInCelsiusWidget(),
                _verticalSpacing15(),
                _weatherInFahrenheitWidget(),
                _verticalSpacing15(),
                _weatherAddressWidget(),
                _verticalSpacing15(),
                _weatherLatitudeWidget(),
                _verticalSpacing15(),
                _weatherLongitudeWidget(),
              ],
            )
          : Text(
              LanguageKey.noHistory.tr,
              style: AppTextStyle.textSize16Bold,
            );
    });
  }

  Widget _weatherIconWidget() {
    return Obx(() {
      return AppImageView(
        imagePath: controller.getAssetPathFromWeatherType(),
        width: AppDimens.dimens250.w,
        height: AppDimens.dimens250.h,
        color: _getWidgetColor(),
      );
    });
  }

  Widget _weatherConditionWidget() {
    return Obx(() {
      return _titleValueWidget(
        LanguageKey.weatherCondition.tr,
        controller.weatherInfo.value?.weatherCondition,
      );
    });
  }

  Widget _weatherInCelsiusWidget() {
    return Obx(() {
      return _titleValueWidget(
        LanguageKey.weatherInCelsius.tr,
        controller.weatherInfo.value?.inCelsius?.toString(),
      );
    });
  }

  Widget _weatherInFahrenheitWidget() {
    return Obx(() {
      return _titleValueWidget(
        LanguageKey.weatherInFahrenheit.tr,
        controller.weatherInfo.value?.inFahrenheit?.toString(),
      );
    });
  }

  Widget _weatherAddressWidget() {
    return Obx(() {
      return _titleValueWidget(
        LanguageKey.address.tr,
        controller.weatherInfo.value?.address,
      );
    });
  }

  Widget _weatherLatitudeWidget() {
    return Obx(() {
      return _titleValueWidget(
        LanguageKey.latitude.tr,
        controller.weatherInfo.value?.latitude?.toString(),
      );
    });
  }

  Widget _weatherLongitudeWidget() {
    return Obx(() {
      return _titleValueWidget(
        LanguageKey.longitude.tr,
        controller.weatherInfo.value?.longitude?.toString(),
      );
    });
  }

  Widget _titleValueWidget(String title, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.textSize14Regular.copyWith(
            color: _getWidgetColor(),
          ),
        ),
        _horizontalSpacing10(),
        Flexible(
          child: Text(
            value ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.textSize14SemiBold.copyWith(
              color: _getWidgetColor(),
            ),
          ),
        ),
      ],
    );
  }
}
