import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/app/routes/app_pages.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/widgets/custom_elevated_button.dart';

import 'controller/memasukkan_unique_code_controller.dart';

// ignore_for_file: must_be_immutable
class MemasukkanUniqueCodeDialog extends StatelessWidget {
  MemasukkanUniqueCodeDialog(this.controller, {Key? key}) : super(key: key);

  MemasukkanUniqueCodeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 66.v),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Spacer(), _buildTwentyEight()]));
  }

  /// Section Widget
  Widget _buildUniqueCodeButton() {
    return CustomElevatedButton(
        height: 51.v,
        text: "lbl_unique_code".tr,
        margin: EdgeInsets.only(left: 9.h, right: 8.h),
        buttonStyle: CustomButtonStyles.fillBlack,
        buttonTextStyle: theme.textTheme.titleLarge!);
  }

  /// Section Widget
  Widget _buildEmployeeIDButton() {
    return CustomElevatedButton(
        height: 51.v,
        text: "lbl_employee_id".tr,
        margin: EdgeInsets.only(left: 9.h, right: 8.h),
        buttonStyle: CustomButtonStyles.fillBlack,
        buttonTextStyle: theme.textTheme.titleLarge!);
  }

  /// Section Widget
  Widget _buildVerifikasiButton() {
    return Expanded(
        child: CustomElevatedButton(
            height: 50.v,
            text: "lbl_verifikasi".tr,
            margin: EdgeInsets.only(right: 8.h),
            buttonStyle: CustomButtonStyles.fillGreenA,
            buttonTextStyle: CustomTextStyles.titleLargeBlack900_1,
            onPressed: () {
              onTapVerifikasiButton();
            }));
  }

  /// Section Widget
  Widget _buildCancelButton() {
    return Expanded(
        child: CustomElevatedButton(
            height: 50.v,
            text: "lbl_cancel".tr,
            margin: EdgeInsets.only(left: 8.h),
            buttonStyle: CustomButtonStyles.fillRedA,
            buttonTextStyle: CustomTextStyles.titleLargeBlack900_1,
            onPressed: () {
              onTapCancelButton();
            }));
  }

  /// Section Widget
  Widget _buildTwentyEight() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 10.v),
        decoration: AppDecoration.fillBluegray100.copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
              width: 166.h,
              child: Text("msg_dont_have_a_unique".tr,
                  maxLines: 3, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: CustomTextStyles.bodyMediumBlack900)),
          SizedBox(height: 16.v),
          _buildUniqueCodeButton(),
          SizedBox(height: 19.v),
          _buildEmployeeIDButton(),
          SizedBox(height: 19.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(right: 8.h),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [_buildVerifikasiButton(), _buildCancelButton()]))),
          SizedBox(height: 15.v)
        ]));
  }

  /// Navigates to the homeUniqueCodeScreen when the action is triggered.
  onTapVerifikasiButton() {
    Get.toNamed(
      Routes.HOME_UNIQUE_CODE_SCREEN,
    );
  }

  /// Navigates to the homeAwalScreen when the action is triggered.
  onTapCancelButton() {
    Get.toNamed(
      Routes.HOME_AWAL_SCREEN,
    );
  }
}
