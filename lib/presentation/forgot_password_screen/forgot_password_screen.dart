import 'controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/utils/validation_functions.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:hifdzi_s_application3/widgets/custom_elevated_button.dart';
import 'package:hifdzi_s_application3/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  ForgotPasswordScreen({Key? key}) : super(key: key);

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
                            padding: EdgeInsets.symmetric(horizontal: 30.h),
                            child: Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgDownloadForgot,
                                  height: 247.v,
                                  width: 256.h),
                              SizedBox(height: 2.v),
                              Text("lbl_forgot_password".tr,
                                  style: theme.textTheme.headlineSmall),
                              SizedBox(height: 19.v),
                              Container(
                                  width: 234.h,
                                  margin:
                                      EdgeInsets.only(left: 33.h, right: 32.h),
                                  child: Text("msg_please_write_your".tr,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyMedium)),
                              SizedBox(height: 12.v),
                              CustomTextFormField(
                                  controller: controller.emailController,
                                  hintText: "lbl_email_address".tr,
                                  hintStyle:
                                      CustomTextStyles.titleLargeBlack900,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "err_msg_please_enter_valid_email"
                                          .tr;
                                    }
                                    return null;
                                  },
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 22.h, vertical: 14.v),
                                  borderDecoration:
                                      TextFormFieldStyleHelper.fillWhiteA,
                                  fillColor: appTheme.whiteA70001),
                              SizedBox(height: 20.v),
                              CustomElevatedButton(
                                  text: "lbl_confirm_mail".tr,
                                  onPressed: () {
                                    onTapConfirmMail();
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
              onTapArrowThree();
            }));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapArrowThree() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the verifyEmailScreen when the action is triggered.
  onTapConfirmMail() {
    Get.toNamed(
      AppRoutes.verifyEmailScreen,
    );
  }
}
