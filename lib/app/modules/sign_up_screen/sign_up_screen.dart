import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/app/routes/app_pages.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/utils/validation_functions.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:hifdzi_s_application3/widgets/custom_elevated_button.dart';
import 'package:hifdzi_s_application3/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

import 'controller/sign_up_controller.dart';

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
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(horizontal: 36.h),
                            child: Column(children: [
                              Text("lbl_hi".tr, style: theme.textTheme.headlineLarge),
                              SizedBox(height: 21.v),
                              Text("msg_create_a_new_account".tr, style: theme.textTheme.titleLarge),
                              SizedBox(height: 31.v),
                              _buildFullName(),
                              // SizedBox(height: 13.v),
                              // CustomDropDown(
                              //     icon: Container(
                              //         margin: EdgeInsets.fromLTRB(
                              //             30.h, 10.v, 14.h, 10.v),
                              //         child: CustomImageView(
                              //             imagePath: ImageConstant.imgCheckmark,
                              //             height: 10.v,
                              //             width: 15.h)),
                              //     hintText: "lbl_gender".tr,
                              //     items: controller.signUpModelObj.value
                              //         .dropdownItemList!.value,
                              //     onChanged: (value) {
                              //       controller.onSelected(value);
                              //     }),
                              // SizedBox(height: 13.v),
                              // _buildDateOfBirth(),
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
                                      padding: EdgeInsets.only(left: 8.h, right: 16.h),
                                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        _buildSignUp(),
                                        Container(
                                            width: 105.h,
                                            margin: EdgeInsets.only(left: 12.h),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(text: "msg_already_have_an2".tr, style: CustomTextStyles.bodyMediumffffffff),
                                                  TextSpan(
                                                      text: "lbl_here".tr,
                                                      style: CustomTextStyles.bodyMediumff0047ff.copyWith(decoration: TextDecoration.underline),
                                                      recognizer: TapGestureRecognizer()
                                                        ..onTap = () {
                                                          Get.toNamed(
                                                            Routes.LOGIN_SCREEN,
                                                          );
                                                        })
                                                ]),
                                                textAlign: TextAlign.left))
                                      ]))),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  void onTapSignUp() async {
    String name = controller.fullNameController.text;
    String password = controller.passwordController.text;
    String email = controller.emailController.text;
    String phone = controller.phoneNumberController.text;

    // Construct the URL of your PHP script
    String url = 'http://192.168.0.107/testingphp/register.php';

    // Create a map containing the form data
    Map<String, String> formData = {
      'name': name,
      'password': password,
      'email': email,
      'phone': phone,
    };

    // Send the HTTP POST request
    try {
      http.Response response = await http.post(Uri.parse(url), body: formData);

      // Check the response from the server
      if (response.statusCode == 200) {
        // Successful registration
        print('Registration successful');
        Get.toNamed(
          Routes.WELCOME_SCREEN,
        );
        // You can handle the response further if needed
      } else {
        // Registration failed
        print('Registration failed: ${response.body}');
        // You can handle the failure scenario here
      }
    } catch (error) {
      print('Error sending request: $error');
      // Handle the error scenario here
    }
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
      Routes.WELCOME_SCREEN,
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  // onTapSignUp() {
  //   Get.toNamed(
  //     AppRoutes.loginScreen,
  //   );
  // }
}
