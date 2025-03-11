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
            child: Column(
              children: [
                _searchByCityWidget(),
                _verticalSpacing30(),
                _weatherIconWidget(),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _verticalSpacing30() {
    return SizedBox(
      height: AppDimens.dimens30.h,
    );
  }

  Widget _searchByCityWidget() {
    return AppOutlinedInputField(
      controller: controller.cityTextEditingController,
      focusNode: controller.cityFocusNode,
      textInputAction: TextInputAction.search,
      textInputType: TextInputType.text,
      hintText: LanguageKey.searchByCity.tr,
      onFieldSubmitted: (value) {},
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
}
