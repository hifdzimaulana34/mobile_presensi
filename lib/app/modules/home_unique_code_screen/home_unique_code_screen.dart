import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/app/routes/app_pages.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/session_controller.dart';
import 'package:hifdzi_s_application3/widgets/custom_elevated_button.dart';

import 'controller/home_unique_code_controller.dart';

class HomeUniqueCodeScreen extends GetWidget<HomeUniqueCodeController> {
  const HomeUniqueCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 42.v),
          child: Column(
            children: [
              _buildProfileImage(),
              SizedBox(height: 19.v),
              Container(
                  width: 235.h,
                  margin: EdgeInsets.symmetric(horizontal: 44.h),
                  child: Text("msg_enjoy_the_facial".tr,
                      maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: theme.textTheme.titleLarge)),
              SizedBox(height: 70.v),
              CustomElevatedButton(
                  height: 50.v,
                  text: "msg_attendance_input".tr,
                  margin: EdgeInsets.only(left: 30.h, right: 29.h),
                  buttonTextStyle: CustomTextStyles.titleLargeBlack900Black,
                  onPressed: () {
                    onTapAttendanceInput();
                  }),
              SizedBox(height: 37.v),
              CustomElevatedButton(
                  height: 50.v,
                  text: "msg_attendance_history".tr,
                  margin: EdgeInsets.only(left: 30.h, right: 29.h),
                  buttonTextStyle: CustomTextStyles.titleLargeBlack900Black,
                  onPressed: () {
                    onTapAttendanceHistory();
                  }),
              SizedBox(height: 37.v),
              CustomElevatedButton(
                height: 50.v,
                // text: "msg_attendance_history".tr,
                text: 'Attendance Permit',
                margin: EdgeInsets.only(left: 30.h, right: 29.h),
                buttonTextStyle: CustomTextStyles.titleLargeBlack900Black,
                onPressed: onTapAttendancePermit,
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileImage() {
    return Align(
      alignment: Alignment.center,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgProfileFreeVe,
            height: 139.adaptSize,
            width: 139.adaptSize,
            onTap: () {
              onTapImgProfileFreeVe();
            },
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 32.v, bottom: 53.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetX<SessionController>(
                    init: SessionController(),
                    builder: (sessionC) {
                      return Text(
                        // "lbl_hi_amirul_yusuf".tr,
                        sessionC.user.value.name,
                        style: CustomTextStyles.headlineSmallTajawalMedium,
                      );
                    },
                  ),
                  SizedBox(height: 3.v),
                  Text(
                    "lbl_polinema2".tr,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleSmallTajawalOnPrimaryContainer,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the myProfileScreen when the action is triggered.
  onTapImgProfileFreeVe() {
    Get.toNamed(
      Routes.MY_PROFILE_SCREEN,
    );
  }

  /// Navigates to the attendanceInputScreen when the action is triggered.
  onTapAttendanceInput() {
    Get.toNamed(
      Routes.ATTENDANCE_INPUT_SCREEN,
    );
  }

  /// Navigates to the attendanceHistoryScreen when the action is triggered.
  onTapAttendanceHistory() {
    Get.toNamed(
      Routes.ATTENDANCE_HISTORY_SCREEN,
    );
  }

  void onTapAttendancePermit() {
    Get.toNamed(Routes.ATTENDANCE_PERMIT);
  }
}
