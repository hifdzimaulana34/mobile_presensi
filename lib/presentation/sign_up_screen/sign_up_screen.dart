import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/utils/validation_functions.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:hifdzi_s_application3/widgets/custom_drop_down.dart';
import 'package:hifdzi_s_application3/widgets/custom_elevated_button.dart';
import 'package:hifdzi_s_application3/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends GetWidget<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);

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
                            padding: EdgeInsets.symmetric(horizontal: 36.h),
                            child: Column(children: [
                              Text("lbl_hi".tr,
                                  style: theme.textTheme.headlineLarge),
                              SizedBox(height: 21.v),
                              Text("msg_create_a_new_account".tr,
                                  style: theme.textTheme.titleLarge),
                              SizedBox(height: 31.v),
                              _buildFullName(),
                              SizedBox(height: 13.v),
                              CustomDropDown(
                                  icon: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          30.h, 10.v, 14.h, 10.v),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgCheckmark,
                                          height: 10.v,
                                          width: 15.h)),
                                  hintText: "lbl_gender".tr,
                                  items: controller.signUpModelObj.value
                                      .dropdownItemList!.value,
                                  onChanged: (value) {
                                    controller.onSelected(value);
                                  }),
                              SizedBox(height: 13.v),
                              _buildDateOfBirth(),
                              SizedBox(height: 15.v),
                              _buildPhoneNumber(),
                              SizedBox(height: 10.v),
                              _buildEmail(),
                              SizedBox(height: 13.v),
                              _buildPassword(),
                              SizedBox(height: 40.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.h, right: 16.h),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _buildSignUp(),
                                            Container(
                                                width: 105.h,
                                                margin:
                                                    EdgeInsets.only(left: 12.h),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "msg_already_have_an2"
                                                                  .tr,
                                                          style: CustomTextStyles
                                                              .bodyMediumffffffff),
                                                      TextSpan(
                                                          text: "lbl_here".tr,
                                                          style: CustomTextStyles
                                                              .bodyMediumff0047ff
                                                              .copyWith(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline))
                                                    ]),
                                                    textAlign: TextAlign.left))
                                          ]))),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrow1,
            margin: EdgeInsets.fromLTRB(24.h, 26.v, 295.h, 26.v),
            onTap: () {
              onTapArrowTwo();
            }));
  }

  /// Section Widget
  Widget _buildFullName() {
    return CustomTextFormField(
        controller: controller.fullNameController,
        hintText: "lbl_full_name".tr,
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        },
        borderDecoration: TextFormFieldStyleHelper.fillPrimary,
        fillColor: theme.colorScheme.primary);
  }

  /// Section Widget
  Widget _buildDateOfBirth() {
    return CustomTextFormField(
        controller: controller.dateOfBirthController,
        hintText: "lbl_date_of_birth".tr,
        borderDecoration: TextFormFieldStyleHelper.fillPrimary,
        fillColor: theme.colorScheme.primary);
  }

  /// Section Widget
  Widget _buildPhoneNumber() {
    return CustomTextFormField(
        controller: controller.phoneNumberController,
        hintText: "lbl_phone_number".tr,
        textInputType: TextInputType.phone,
        validator: (value) {
          if (!isValidPhone(value)) {
            return "err_msg_please_enter_valid_phone_number".tr;
          }
          return null;
        },
        borderDecoration: TextFormFieldStyleHelper.fillPrimary,
        fillColor: theme.colorScheme.primary);
  }

  /// Section Widget
  Widget _buildEmail() {
    return CustomTextFormField(
        controller: controller.emailController,
        hintText: "lbl_email".tr,
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        },
        borderDecoration: TextFormFieldStyleHelper.fillPrimary,
        fillColor: theme.colorScheme.primary);
  }

  /// Section Widget
  Widget _buildPassword() {
    return CustomTextFormField(
        controller: controller.passwordController,
        hintText: "lbl_password2".tr,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || (!isValidPassword(value, isRequired: true))) {
            return "err_msg_please_enter_valid_password".tr;
          }
          return null;
        },
        obscureText: true,
        borderDecoration: TextFormFieldStyleHelper.fillPrimary,
        fillColor: theme.colorScheme.primary);
  }

  /// Section Widget
  Widget _buildSignUp() {
    return CustomElevatedButton(
        height: 48.v,
        width: 146.h,
        text: "lbl_sign_up".tr,
        margin: EdgeInsets.only(top: 1.v, bottom: 9.v),
        buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
        buttonTextStyle: CustomTextStyles.titleLargeInikaBlack900,
        onPressed: () {
          onTapSignUp();
        });
  }

  /// Navigates to the welcomeScreen when the action is triggered.
  onTapArrowTwo() {
    Get.toNamed(
      AppRoutes.welcomeScreen,
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapSignUp() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}
