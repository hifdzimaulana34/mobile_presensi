import 'controller/attendance_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/custom_app_bar.dart';

class AttendanceHistoryScreen extends GetWidget<AttendanceHistoryController> {
  const AttendanceHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: SingleChildScrollView(
              child: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    SizedBox(height: 17.v),
                    Text("msg_attendance_history".tr,
                        style: theme.textTheme.headlineLarge),
                    SizedBox(height: 7.v),
                    _buildTen(),
                    SizedBox(height: 9.v),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.h),
                        decoration: AppDecoration.fillBluegray10001,
                        child: Column(children: [
                          SizedBox(height: 3.v),
                          _buildEight(),
                          SizedBox(
                              height: 393.v,
                              width: 345.h,
                              child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            margin:
                                                EdgeInsets.only(right: 282.h),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 11.h,
                                                vertical: 5.v),
                                            decoration:
                                                AppDecoration.fillBluegray10001,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 1.v),
                                                  Container(
                                                      width: 32.h,
                                                      margin: EdgeInsets.only(
                                                          left: 5.h,
                                                          right: 1.h),
                                                      child: Text(
                                                          "lbl_01_mon".tr,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: theme.textTheme
                                                              .bodyLarge)),
                                                  SizedBox(height: 20.v),
                                                  Container(
                                                      width: 27.h,
                                                      margin: EdgeInsets.only(
                                                          left: 8.h,
                                                          right: 1.h),
                                                      child: Text(
                                                          "lbl_02_tue".tr,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: theme.textTheme
                                                              .bodyLarge)),
                                                  SizedBox(height: 20.v),
                                                  SizedBox(
                                                      width: 34.h,
                                                      child: Text(
                                                          "lbl_03_wed".tr,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: theme.textTheme
                                                              .bodyLarge)),
                                                  SizedBox(height: 20.v),
                                                  Container(
                                                      width: 28.h,
                                                      margin: EdgeInsets.only(
                                                          left: 7.h,
                                                          right: 1.h),
                                                      child: Text(
                                                          "lbl_04_thu".tr,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: theme.textTheme
                                                              .bodyLarge)),
                                                  SizedBox(height: 20.v),
                                                  Container(
                                                      width: 25.h,
                                                      margin: EdgeInsets.only(
                                                          right: 7.h),
                                                      child: Text(
                                                          "lbl_05_fri".tr,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: theme.textTheme
                                                              .bodyLarge)),
                                                  SizedBox(height: 20.v),
                                                  Container(
                                                      width: 25.h,
                                                      margin: EdgeInsets.only(
                                                          right: 3.h),
                                                      child: Text(
                                                          "lbl_06_sat".tr,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: theme.textTheme
                                                              .bodyLarge))
                                                ]))),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 142.h, right: 118.h),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.h,
                                                vertical: 15.v),
                                            decoration:
                                                AppDecoration.fillBluegray10001,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 3.v),
                                                  Text("lbl_04_00_pm".tr,
                                                      style: theme
                                                          .textTheme.bodyLarge),
                                                  SizedBox(height: 42.v),
                                                  Text("lbl_04_00_pm".tr,
                                                      style: theme
                                                          .textTheme.bodyLarge),
                                                  SizedBox(height: 47.v),
                                                  Text("lbl_04_00_pm".tr,
                                                      style: theme
                                                          .textTheme.bodyLarge),
                                                  SizedBox(height: 55.v),
                                                  Text("lbl_04_00_pm".tr,
                                                      style: theme
                                                          .textTheme.bodyLarge),
                                                  SizedBox(height: 46.v),
                                                  Text("lbl_04_00_pm".tr,
                                                      style: theme
                                                          .textTheme.bodyLarge),
                                                  SizedBox(height: 37.v),
                                                  Text("lbl_04_00_pm".tr,
                                                      style: theme
                                                          .textTheme.bodyLarge)
                                                ]))),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 63.h, top: 17.v),
                                            child: Text("lbl_08_00_am".tr,
                                                style: theme
                                                    .textTheme.bodyLarge))),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 17.v, right: 17.h),
                                            child: Text("lbl_08_h_00_m".tr,
                                                style: theme
                                                    .textTheme.bodyLarge))),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 64.h, top: 81.v),
                                            child: Text("lbl_08_00_am".tr,
                                                style: theme
                                                    .textTheme.bodyLarge))),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 81.v, right: 16.h),
                                            child: Text("lbl_08_h_00_m".tr,
                                                style: theme
                                                    .textTheme.bodyLarge))),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 64.h, top: 150.v),
                                            child: Text("lbl_08_00_am".tr,
                                                style: theme
                                                    .textTheme.bodyLarge))),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 150.v, right: 16.h),
                                            child: Text("lbl_08_h_00_m".tr,
                                                style: theme
                                                    .textTheme.bodyLarge))),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 64.h, bottom: 143.v),
                                            child: Text("lbl_08_00_am".tr,
                                                style: theme
                                                    .textTheme.bodyLarge))),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                right: 16.h, bottom: 143.v),
                                            child: Text("lbl_08_h_00_m".tr,
                                                style: theme
                                                    .textTheme.bodyLarge))),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 63.h, bottom: 75.v),
                                            child: Text("lbl_08_00_am".tr,
                                                style: theme
                                                    .textTheme.bodyLarge))),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                right: 17.h, bottom: 75.v),
                                            child: Text("lbl_08_h_00_m".tr,
                                                style: theme
                                                    .textTheme.bodyLarge))),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 64.h, bottom: 16.v),
                                            child: Text("lbl_08_00_am".tr,
                                                style: theme
                                                    .textTheme.bodyLarge))),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                right: 16.h, bottom: 16.v),
                                            child: Text("lbl_08_h_00_m".tr,
                                                style: theme
                                                    .textTheme.bodyLarge))),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Padding(
                                            padding: EdgeInsets.only(top: 61.v),
                                            child: SizedBox(
                                                width: 345.h,
                                                child: Divider()))),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(top: 129.v),
                                            child: SizedBox(
                                                width: 345.h,
                                                child: Divider()))),
                                    Align(
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                            width: 345.h, child: Divider())),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 119.v),
                                            child: SizedBox(
                                                width: 345.h,
                                                child: Divider()))),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 54.v),
                                            child: SizedBox(
                                                width: 345.h,
                                                child: Divider())))
                                  ]))
                        ]))
                  ])),
            )));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(actions: [
      AppbarTrailingImage(
          imagePath: ImageConstant.imgProfileFreeVe,
          margin: EdgeInsets.symmetric(horizontal: 15.h, vertical: 3.v))
    ]);
  }

  /// Section Widget
  Widget _buildTen() {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 88.h, vertical: 11.v),
        decoration: AppDecoration.fillBlack,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 15.v,
                  width: 10.h,
                  margin: EdgeInsets.only(top: 3.v, bottom: 5.v),
                  onTap: () {
                    onTapImgArrowLeft();
                  }),
              Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Text("lbl_january_2024".tr,
                      style: CustomTextStyles.titleLargeRegular)),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 15.v,
                  width: 10.h,
                  margin: EdgeInsets.only(top: 3.v, right: 1.h, bottom: 5.v))
            ]));
  }

  /// Section Widget
  Widget _buildEight() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 12.v),
        decoration: AppDecoration.fillBlack,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 7.v),
                  child: Text("lbl_date".tr,
                      style: CustomTextStyles.bodyLargeOnPrimaryContainer)),
              Padding(
                  padding: EdgeInsets.only(left: 20.h, bottom: 8.v),
                  child: Text("lbl_clock_in".tr,
                      style: CustomTextStyles.bodyLargeOnPrimaryContainer)),
              Padding(
                  padding: EdgeInsets.only(left: 24.h, bottom: 8.v),
                  child: Text("lbl_clock_out".tr,
                      style: CustomTextStyles.bodyLargeOnPrimaryContainer)),
              Padding(
                  padding: EdgeInsets.only(left: 12.h, bottom: 6.v),
                  child: Text("lbl_working_hr_s".tr,
                      style: CustomTextStyles.bodyLargeOnPrimaryContainer))
            ]));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }
}
