import 'controller/attendance_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/custom_app_bar.dart';

class AttendanceInputScreen extends GetWidget<AttendanceInputController> {
  const AttendanceInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 19.v),
                child: Column(children: [
                  Text("msg_attendance_input".tr,
                      style: theme.textTheme.headlineLarge),
                  SizedBox(height: 60.v),
                  _buildAttendanceInput(),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(actions: [
      AppbarTrailingImage(
          imagePath: ImageConstant.imgProfileFreeVe,
          margin: EdgeInsets.symmetric(horizontal: 14.h, vertical: 3.v))
    ]);
  }

  /// Section Widget
  Widget _buildAttendanceInput() {
    return Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 18.v),
        decoration: AppDecoration.fillBluegray10002
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  decoration: AppDecoration.fillPrimary,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: 1.h, top: 3.v, bottom: 7.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("lbl_clock_in".tr,
                                      style: CustomTextStyles
                                          .headlineSmallTajawalBlack900),
                                  SizedBox(height: 1.v),
                                  Container(
                                      width: 135.h,
                                      margin: EdgeInsets.only(left: 3.h),
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "msg_mon_tue_wed_thu2".tr,
                                                style: CustomTextStyles
                                                    .titleLargeff000000Regular),
                                            TextSpan(
                                                text: "lbl_at_7_am_to_9_am".tr,
                                                style: CustomTextStyles
                                                    .titleLargeff000000)
                                          ]),
                                          textAlign: TextAlign.left))
                                ])),
                        CustomImageView(
                            imagePath: ImageConstant.img,
                            height: 114.v,
                            width: 95.h,
                            margin: EdgeInsets.only(bottom: 4.v),
                            onTap: () {
                              onTapImgImage();
                            })
                      ])),
              SizedBox(height: 5.v),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  decoration: AppDecoration.fillPrimary,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: 1.h, top: 3.v, bottom: 7.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("lbl_clock_out".tr,
                                      style: CustomTextStyles
                                          .headlineSmallTajawalBlack900),
                                  SizedBox(height: 1.v),
                                  Container(
                                      width: 135.h,
                                      margin: EdgeInsets.only(left: 3.h),
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "msg_mon_tue_wed_thu2".tr,
                                                style: CustomTextStyles
                                                    .titleLargeff000000Regular),
                                            TextSpan(
                                                text: "lbl_at_4_pm_to_5_pm".tr,
                                                style: CustomTextStyles
                                                    .titleLargeff000000)
                                          ]),
                                          textAlign: TextAlign.left))
                                ])),
                        CustomImageView(
                            imagePath: ImageConstant.img,
                            height: 114.v,
                            width: 95.h,
                            margin: EdgeInsets.only(bottom: 4.v),
                            onTap: () {
                              onTapImgImage();
                            })
                      ])),
            ]));
  }

  /// Navigates to the takeASelfieScreen when the action is triggered.
  onTapImgImage() {
    Get.toNamed(
      AppRoutes.takeASelfieScreen,
    );
  }
}
