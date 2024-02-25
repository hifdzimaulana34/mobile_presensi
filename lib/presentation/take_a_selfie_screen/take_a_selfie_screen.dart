import 'controller/take_a_selfie_controller.dart';
import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/widgets/custom_elevated_button.dart';

class TakeASelfieScreen extends GetWidget<TakeASelfieController> {
  const TakeASelfieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 27.v),
                child: Column(children: [
                  SizedBox(height: 26.v),
                  _buildTakeASelfieSection(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                            width: 102.h,
                            margin: EdgeInsets.only(left: 43.h),
                            child: Text("msg_monday_at_08_00".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.titleLargeGray50)),
                      )),
                  SizedBox(height: 10.v),
                  _buildProfileSection()
                ])),
            bottomNavigationBar: _buildSaveSection()));
  }

  /// Section Widget
  Widget _buildTakeASelfieSection() {
    return SizedBox(
        height: 74.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: 38.v,
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: appTheme.black900))),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text("lbl_take_a_selfie".tr,
                      style: theme.textTheme.headlineSmall))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 40.h, top: 45.v),
                  child: Text("lbl_come_to_work".tr,
                      style: CustomTextStyles.headlineSmallTajawal))),
        ]));
  }

  /// Section Widget
  Widget _buildProfileSection() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 33.h),
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 21.v),
        decoration: AppDecoration.fillBluegray10001,
        child: CustomImageView(
            imagePath: ImageConstant.imgProfileFreeVe,
            height: 200.v,
            width: 200.h));
  }

  /// Section Widget
  Widget _buildSaveSection() {
    return CustomElevatedButton(
        height: 53.v,
        width: 176.h,
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 92.h, right: 92.h, bottom: 55.v),
        buttonStyle: CustomButtonStyles.fillWhiteA,
        buttonTextStyle: CustomTextStyles.headlineSmallBlack900,
        onPressed: () {
          onTapSaveSection();
        });
  }

  /// Navigates to the homeUniqueCodeScreen when the action is triggered.
  onTapSaveSection() {
    Get.toNamed(
      AppRoutes.homeUniqueCodeScreen,
    );
  }
}
