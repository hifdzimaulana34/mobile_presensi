import 'controller/verify_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:hifdzi_s_application3/widgets/custom_elevated_button.dart';
import 'package:hifdzi_s_application3/widgets/custom_pin_code_text_field.dart';

class VerifyEmailScreen extends GetWidget<VerifyEmailController> {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgDownloadForgot,
                      height: 247.v,
                      width: 256.h),
                  SizedBox(height: 3.v),
                  Text("msg_verify_email_address".tr,
                      style: theme.textTheme.headlineSmall),
                  SizedBox(height: 12.v),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "msg_verification_code2".tr,
                            style: CustomTextStyles.bodyMediumffffffff),
                        TextSpan(
                            text: "lbl_gmail_com".tr,
                            style: CustomTextStyles.bodyMediumff0065fc
                                .copyWith(decoration: TextDecoration.underline))
                      ]),
                      textAlign: TextAlign.left),
                  SizedBox(height: 28.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: Obx(() => CustomPinCodeTextField(
                          context: Get.context!,
                          controller: controller.otpController.value,
                          onChanged: (value) {}))),
                  SizedBox(height: 29.v),
                  CustomElevatedButton(
                      text: "lbl_confirm_code".tr,
                      onPressed: () {
                        onTapConfirmCode();
                      }),
                  SizedBox(height: 6.v),
                  Text("msg_00_22_resend_confirmation".tr,
                      style: theme.textTheme.bodyMedium),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 359.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrow3,
            margin: EdgeInsets.fromLTRB(24.h, 27.v, 295.h, 27.v),
            onTap: () {
              onTapArrowFour();
            }));
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapArrowFour() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  /// Navigates to the newPasswordScreen when the action is triggered.
  onTapConfirmCode() {
    Get.toNamed(
      AppRoutes.newPasswordScreen,
    );
  }
}
