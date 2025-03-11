import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../localizations/language_keys.dart';
import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';
import './home_controller.dart';

// Ref. https://media.istockphoto.com/id/1398872170/vector/weather-application-user-interface-ui-ux-elements-realistic-smartphone-with-different.jpg?s=612x612&w=0&k=20&c=c3hnjeDKrqcAJaBkpBV6mct73H2xhwr_pxgC3StskQ4=

class HomePage extends GetView<HomeController> {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: controller.getBgColorsFromWeatherType(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: AppDimens.dimensScreenHorizontalMargin.w,
              right: AppDimens.dimensScreenHorizontalMargin.w,
              top: AppDimens.dimens20.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _appBarWidget(),
                  _verticalSpacing30(),
                  _searchByCityWidget(),
                  _verticalSpacing30(),
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
                  _verticalSpacing15(),
                ],
              ),
            ),
          ),
        ),
      );
    });
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
      title: LanguageKey.appName.tr,
    );
  }

  Widget _searchByCityWidget() {
    return AppOutlinedInputField(
      controller: controller.cityTextEditingController,
      focusNode: controller.cityFocusNode,
      textInputAction: TextInputAction.search,
      textInputType: TextInputType.text,
      hintText: LanguageKey.searchByCity.tr,
      onFieldSubmitted: (value) {
        controller.fetchCurrentWeatherThroughCity(value);
      },
    );
  }

  Widget _weatherIconWidget() {
    return Obx(() {
      return AppImageView(
        imagePath: controller.getAssetPathFromWeatherType(),
        width: AppDimens.dimens250.w,
        height: AppDimens.dimens250.h,
        color: AppColors.colorWhite,
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
            color: AppColors.colorWhite,
          ),
        ),
        Expanded(
          child: Text(
            value ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.textSize14SemiBold.copyWith(
              color: AppColors.colorWhite,
            ),
          ),
        ),
      ],
    );
  }
}
