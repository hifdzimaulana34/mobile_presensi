import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 45.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgFaceRecognitio,
                          height: 236.v,
                          width: 263.h),
                      SizedBox(height: 20.v),
                      SizedBox(
                          width: 145.h,
                          child: Text("lbl_presensee".tr,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles
                                  .titleLargeInknutAntiquaGray5001)),
                      SizedBox(height: 15.v),
                      SizedBox(
                          width: 269.h,
                          child: Text("msg_the_best_place_to".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style:
                                  CustomTextStyles.titleSmallTajawalWhiteA700)),
                      SizedBox(height: 5.v)
                    ]))));
  }
}
