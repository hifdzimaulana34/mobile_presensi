import 'controller/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/widgets/custom_elevated_button.dart';

class WelcomeScreen extends GetWidget<WelcomeController> {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 45.h, vertical: 32.v),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgFaceRecognitio,
                      height: 236.v,
                      width: 263.h),
                  SizedBox(height: 21.v),
                  SizedBox(
                      width: 125.h,
                      child: Text("lbl_hello".tr,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles
                              .titleLargeInknutAntiquaGray5001)),
                  SizedBox(height: 14.v),
                  SizedBox(
                      width: 269.h,
                      child: Text("msg_the_best_place_to".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.titleSmallTajawalWhiteA700)),
                  SizedBox(height: 38.v),
                  CustomElevatedButton(
                      text: "lbl_log_in".tr,
                      margin: EdgeInsets.symmetric(horizontal: 9.h),
                      onPressed: () {
                        onTapLOGIN();
                      }),
                  SizedBox(height: 38.v),
                  CustomElevatedButton(
                      text: "lbl_sign_up".tr,
                      margin: EdgeInsets.symmetric(horizontal: 9.h),
                      buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
                      buttonTextStyle: CustomTextStyles.titleLargeInikaBlack900,
                      onPressed: () {
                        onTapSIGNUP();
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapLOGIN() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapSIGNUP() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}
