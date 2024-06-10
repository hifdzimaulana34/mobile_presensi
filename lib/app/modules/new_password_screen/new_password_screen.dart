import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/app/routes/app_pages.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/utils/validation_functions.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:hifdzi_s_application3/widgets/custom_elevated_button.dart';
import 'package:hifdzi_s_application3/widgets/custom_text_form_field.dart';

import 'controller/new_password_controller.dart';

// ignore_for_file: must_be_immutable
class NewPasswordScreen extends GetWidget<NewPasswordController> {
  NewPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 26.h, vertical: 2.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 7.h),
                                      child: Text("lbl_new_password".tr,
                                          style:
                                              theme.textTheme.headlineSmall)),
                                  SizedBox(height: 11.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 7.h),
                                      child: Text("msg_please_write_your2".tr,
                                          style: theme.textTheme.bodyMedium)),
                                  SizedBox(height: 63.v),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 7.h, right: 8.h),
                                      child: Obx(() => CustomTextFormField(
                                          controller:
                                              controller.passwordController,
                                          hintText: "lbl_password".tr,
                                          hintStyle: CustomTextStyles
                                              .titleLargeBlack900,
                                          textInputType:
                                              TextInputType.visiblePassword,
                                          alignment: Alignment.center,
                                          suffix: InkWell(
                                              onTap: () {
                                                controller
                                                        .isShowPassword.value =
                                                    !controller
                                                        .isShowPassword.value;
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      30.h, 16.v, 21.h, 16.v),
                                                  child: CustomImageView(
                                                      imagePath:
                                                          ImageConstant.imgEye,
                                                      height: 20.v,
                                                      width: 25.h))),
                                          suffixConstraints:
                                              BoxConstraints(maxHeight: 54.v),
                                          validator: (value) {
                                            if (value == null ||
                                                (!isValidPassword(value,
                                                    isRequired: true))) {
                                              return "err_msg_please_enter_valid_password"
                                                  .tr;
                                            }
                                            return null;
                                          },
                                          obscureText:
                                              controller.isShowPassword.value,
                                          contentPadding: EdgeInsets.only(
                                              left: 18.h,
                                              top: 15.v,
                                              bottom: 15.v),
                                          borderDecoration:
                                              TextFormFieldStyleHelper
                                                  .fillOnPrimaryContainer,
                                          fillColor: theme.colorScheme
                                              .onPrimaryContainer))),
                                  SizedBox(height: 30.v),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 7.h, right: 8.h),
                                      child: Obx(() => CustomTextFormField(
                                          controller: controller
                                              .confirmpasswordController,
                                          hintText: "msg_confirm_password".tr,
                                          hintStyle: CustomTextStyles
                                              .titleLargeBlack900,
                                          textInputAction: TextInputAction.done,
                                          textInputType:
                                              TextInputType.visiblePassword,
                                          alignment: Alignment.center,
                                          suffix: InkWell(
                                              onTap: () {
                                                controller
                                                        .isShowPassword1.value =
                                                    !controller
                                                        .isShowPassword1.value;
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      30.h, 16.v, 21.h, 16.v),
                                                  child: CustomImageView(
                                                      imagePath:
                                                          ImageConstant.imgEye,
                                                      height: 20.v,
                                                      width: 25.h))),
                                          suffixConstraints:
                                              BoxConstraints(maxHeight: 54.v),
                                          validator: (value) {
                                            if (value == null ||
                                                (!isValidPassword(value,
                                                    isRequired: true))) {
                                              return "err_msg_please_enter_valid_password"
                                                  .tr;
                                            }
                                            return null;
                                          },
                                          obscureText:
                                              controller.isShowPassword1.value,
                                          contentPadding: EdgeInsets.only(
                                              left: 18.h,
                                              top: 15.v,
                                              bottom: 15.v),
                                          borderDecoration:
                                              TextFormFieldStyleHelper
                                                  .fillOnPrimaryContainer,
                                          fillColor: theme.colorScheme
                                              .onPrimaryContainer))),
                                  SizedBox(height: 30.v),
                                  CustomElevatedButton(
                                      text: "msg_confirm_password2".tr,
                                      margin: EdgeInsets.only(right: 8.h),
                                      onPressed: () {
                                        onTapConfirmPassword();
                                      }),
                                  SizedBox(height: 5.v)
                                ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 359.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrow3,
            margin: EdgeInsets.fromLTRB(24.h, 27.v, 295.h, 27.v),
            onTap: () {
              onTapArrowFive();
            }));
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapArrowFive() {
    Get.toNamed(
      Routes.FORGOT_PASSWORD_SCREEN,
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapConfirmPassword() {
    Get.toNamed(
      Routes.LOGIN_SCREEN,
    );
  }
}
