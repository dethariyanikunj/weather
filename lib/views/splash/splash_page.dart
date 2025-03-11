import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';
import './splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImageView(
                imagePath: AppAssets.icSplashLogo,
                width: AppDimens.dimens200.w,
                height: AppDimens.dimens200.h,
              ),
              Obx(
                () => Text(
                  controller.appName.value,
                  style: AppTextStyle.textSize24SemiBold.copyWith(
                    color: AppColors.colorWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
