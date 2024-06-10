import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/app/routes/app_pages.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';

import 'controller/app_navigation_controller.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "Forgot Password".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.FORGOT_PASSWORD_SCREEN),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Verify email".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.VERIFY_EMAIL_SCREEN),
                        ),
                        _buildScreenTitle(
                          screenTitle: "New password".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.NEW_PASSWORD_SCREEN),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Attendance Input".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.ATTENDANCE_INPUT_SCREEN),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Splash Screen".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.SPLASH_SCREEN),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Login".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.LOGIN_SCREEN),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Home Awal".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.HOME_AWAL_SCREEN),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Home unique Code".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.HOME_UNIQUE_CODE_SCREEN),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Take a Selfie".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.TAKE_A_SELFIE_SCREEN),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Welcome".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.WELCOME_SCREEN),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Attendance History".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.ATTENDANCE_HISTORY_SCREEN),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Sign Up".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.SIGN_UP_SCREEN),
                        ),
                        _buildScreenTitle(
                          screenTitle: "My Profile".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.MY_PROFILE_SCREEN),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Edit Profile".tr,
                          onTapScreenTitle: () => onTapScreenTitle(Routes.EDIT_PROFILE_SCREEN),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
