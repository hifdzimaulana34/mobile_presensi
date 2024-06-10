import 'dart:convert' show json;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hifdzi_s_application3/app/routes/app_pages.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/utils/validation_functions.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:hifdzi_s_application3/widgets/custom_elevated_button.dart';
import 'package:hifdzi_s_application3/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

import 'controller/login_controller.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

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
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 35.v),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Align(alignment: Alignment.center, child: Text("lbl_welcome".tr, style: theme.textTheme.headlineLarge)),
                              SizedBox(height: 23.v),
                              Align(alignment: Alignment.center, child: Text("msg_sign_in_to_continue".tr, style: theme.textTheme.titleLarge)),
                              SizedBox(height: 50.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 18.h),
                                  child: CustomTextFormField(
                                      controller: controller.nameController,
                                      hintText: "name".tr,
                                      textInputType: TextInputType.emailAddress,
                                      alignment: Alignment.centerRight,
                                      validator: (value) {
                                        if (value == null || (!isValidEmail(value, isRequired: true))) {
                                          return "err_msg_please_enter_valid_email".tr;
                                        }
                                        return null;
                                      },
                                      contentPadding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 13.v),
                                      borderDecoration: TextFormFieldStyleHelper.fillPrimary,
                                      fillColor: theme.colorScheme.primary)),
                              SizedBox(height: 46.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 18.h),
                                  child: Obx(() => CustomTextFormField(
                                      controller: controller.passwordController,
                                      hintText: "lbl_password2".tr,
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.visiblePassword,
                                      alignment: Alignment.centerRight,
                                      suffix: InkWell(
                                          onTap: () {
                                            controller.isShowPassword.value = !controller.isShowPassword.value;
                                          },
                                          child: Container(
                                              margin: EdgeInsets.fromLTRB(30.h, 13.v, 21.h, 13.v),
                                              child: CustomImageView(imagePath: ImageConstant.imgEye, height: 20.v, width: 25.h))),
                                      suffixConstraints: BoxConstraints(maxHeight: 50.v),
                                      validator: (value) {
                                        if (value == null || (!isValidPassword(value, isRequired: true))) {
                                          return "err_msg_please_enter_valid_password".tr;
                                        }
                                        return null;
                                      },
                                      obscureText: controller.isShowPassword.value,
                                      contentPadding: EdgeInsets.only(left: 22.h, top: 13.v, bottom: 13.v),
                                      borderDecoration: TextFormFieldStyleHelper.fillPrimary,
                                      fillColor: theme.colorScheme.primary))),
                              SizedBox(height: 40.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 18.h, right: 31.h),
                                  child: Row(children: [
                                    CustomElevatedButton(
                                        height: 48.v,
                                        width: 146.h,
                                        text: "lbl_log_in".tr,
                                        margin: EdgeInsets.symmetric(vertical: 4.v),
                                        buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
                                        buttonTextStyle: CustomTextStyles.titleLargeInikaBlack900,
                                        onPressed: () {
                                          onTapLOGIN();
                                        }),
                                    Container(
                                        width: 96.h,
                                        margin: EdgeInsets.only(left: 12.h),
                                        child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(text: "msg_dont_have_an_ac2".tr, style: CustomTextStyles.bodyMediumffffffff),
                                              TextSpan(
                                                  text: "lbl_here".tr,
                                                  style: CustomTextStyles.bodyMediumff0047ff.copyWith(decoration: TextDecoration.underline),
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () {
                                                      Get.toNamed(
                                                        Routes.SIGN_UP_SCREEN,
                                                      );
                                                    })
                                            ]),
                                            textAlign: TextAlign.left))
                                  ])),
                              SizedBox(height: 21.v),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtForgotThePassword();
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 61.h),
                                      child: Text("msg_forgot_the_password".tr, style: CustomTextStyles.titleSmallOnPrimaryContainer))),
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
              onTapArrowOne();
            }));
  }

  /// Navigates to the welcomeScreen when the action is triggered.
  onTapArrowOne() {
    Get.toNamed(
      Routes.WELCOME_SCREEN,
    );
  }

  /// Navigates to the homeAwalScreen when the action is triggered.
  void onTapLOGIN() async {
    String name = controller.nameController.text;
    String pass = controller.passwordController.text;

    String url = 'http://192.168.0.107/testingphp/login.php';
    var response = await http.post(Uri.parse(url), body: {
      "name": name,
      "password": pass,
    });

    print("Server Response: ${response.body}");

    try {
      var data = json.decode(response.body);
      if (data == "Success") {
        Fluttertoast.showToast(
            msg: "Login Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        Get.toNamed(Routes.HOME_AWAL_SCREEN);
      } else {
        Fluttertoast.showToast(
            msg: "Login Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print("Error decoding JSON response: $e");
      Fluttertoast.showToast(
          msg: "Unexpected error occurred",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapTxtForgotThePassword() {
    Get.toNamed(
      Routes.FORGOT_PASSWORD_SCREEN,
    );
  }
}
