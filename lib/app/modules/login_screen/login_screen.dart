import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hifdzi_s_application3/app/routes/app_pages.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:hifdzi_s_application3/widgets/default_button.dart';
import 'package:hifdzi_s_application3/widgets/input_builder.dart';

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
                child: FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(alignment: Alignment.center, child: Text("lbl_welcome".tr, style: theme.textTheme.headlineLarge)),
                      SizedBox(height: 23.v),
                      Align(alignment: Alignment.center, child: Text("msg_sign_in_to_continue".tr, style: theme.textTheme.titleLarge)),
                      SizedBox(height: 50.v),
                      InputBuilder(
                        name: 'email',
                        hintText: 'Email',
                        isRequired: true,
                        isEmail: true,
                        autoValidate: AutovalidateMode.onUserInteraction,
                        border: OutlineInputBorder(),
                      ),
                      SizedBox(height: 46.v),
                      Obx(
                        () => InputBuilder(
                          name: 'password',
                          hintText: 'Password',
                          maskText: controller.isMaskPassword.value,
                          isRequired: true,
                          border: OutlineInputBorder(),
                          autoValidate: AutovalidateMode.onUserInteraction,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.isMaskPassword.value = !controller.isMaskPassword.value;
                            },
                            icon: Icon(
                              controller.isMaskPassword.value ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.v),
                      Center(
                        child: DefaultButton(
                          onTap: () {
                            controller.onTapLOGIN();
                          },
                          text: 'LOG IN',
                        ),
                      ),
                      SizedBox(height: 21.v),
                      GestureDetector(
                        onTap: () {
                          controller.onTapTxtForgotThePassword();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 61.h),
                          child: Text(
                            "msg_forgot_the_password".tr,
                            style: CustomTextStyles.titleSmallOnPrimaryContainer,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.v)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
        },
      ),
    );
  }

  /// Navigates to the welcomeScreen when the action is triggered.
  onTapArrowOne() {
    Get.toNamed(
      Routes.WELCOME_SCREEN,
    );
  }
}
