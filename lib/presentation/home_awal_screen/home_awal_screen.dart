import 'controller/home_awal_controller.dart';
import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/widgets/custom_elevated_button.dart';

class HomeAwalScreen extends GetWidget<HomeAwalController> {
  const HomeAwalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 48.h, vertical: 43.v),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgProfileFreeVe,
                      height: 169.v,
                      width: 174.h),
                  SizedBox(height: 15.v),
                  Text("lbl_hi_amirul_yusuf".tr,
                      style: theme.textTheme.titleLarge),
                  SizedBox(height: 32.v),
                  CustomElevatedButton(
                      height: 59.v,
                      text: "lbl_polinema".tr,
                      rightIcon: Container(
                          margin: EdgeInsets.only(left: 30.h),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgEdit,
                              height: 25.adaptSize,
                              width: 25.adaptSize)),
                      onPressed: () {
                        onTapPOLINEMA();
                      }),
                  SizedBox(height: 15.v),
                  CustomElevatedButton(
                      height: 59.v,
                      text: "lbl_pertamina".tr,
                      rightIcon: Container(
                          margin: EdgeInsets.only(left: 30.h),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgEdit,
                              height: 25.adaptSize,
                              width: 25.adaptSize)),
                      onPressed: () {
                        onTapPERTAMINA();
                      }),
                  SizedBox(height: 31.v),
                  CustomElevatedButton(
                      height: 48.v,
                      text: "msg_enter_unique_code".tr,
                      margin: EdgeInsets.only(left: 4.h, right: 5.h),
                      buttonStyle:
                          CustomButtonStyles.fillOnPrimaryContainerTL10,
                      buttonTextStyle: CustomTextStyles.titleLargeBlack900_1,
                      onPressed: () {
                        onTapEnterUniqueCode();
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Navigates to the attendanceInputScreen when the action is triggered.
  onTapPOLINEMA() {
    Get.toNamed(
      AppRoutes.attendanceInputScreen,
    );
  }

  /// Navigates to the attendanceInputScreen when the action is triggered.
  onTapPERTAMINA() {
    Get.toNamed(
      AppRoutes.attendanceInputScreen,
    );
  }

  /// Navigates to the attendanceInputScreen when the action is triggered.
  onTapEnterUniqueCode() {
    Get.toNamed(
      AppRoutes.attendanceInputScreen,
    );
  }
}
