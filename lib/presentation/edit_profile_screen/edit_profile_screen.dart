import 'controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/utils/validation_functions.dart';
import 'package:hifdzi_s_application3/widgets/custom_drop_down.dart';
import 'package:hifdzi_s_application3/widgets/custom_floating_text_field.dart';
import 'package:hifdzi_s_application3/widgets/custom_radio_button.dart';
import 'package:hifdzi_s_application3/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class EditProfileScreen extends GetWidget<EditProfileController> {
  EditProfileScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.h, vertical: 9.v),
                            child: Column(children: [
                              SizedBox(height: 27.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 16.h),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgArrow1,
                                                height: 2.v,
                                                width: 41.h,
                                                margin: EdgeInsets.only(
                                                    bottom: 38.v),
                                                onTap: () {
                                                  onTapImgArrowSix();
                                                }),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 36.h),
                                                child: Text(
                                                    "lbl_edit_profile".tr,
                                                    style: theme.textTheme
                                                        .headlineLarge))
                                          ]))),
                              SizedBox(height: 8.v),
                              SizedBox(
                                  height: 120.v,
                                  width: 131.h,
                                  child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgProfileFreeVe,
                                            height: 120.v,
                                            width: 119.h,
                                            alignment: Alignment.centerLeft),
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                                height: 38.v,
                                                width: 50.h,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.h,
                                                    vertical: 7.v),
                                                decoration: AppDecoration
                                                    .fillOnPrimaryContainer
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder10),
                                                child: CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgCamera,
                                                    height: 24.v,
                                                    width: 38.h,
                                                    alignment:
                                                        Alignment.center)))
                                      ])),
                              SizedBox(height: 14.v),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.h, vertical: 3.v),
                                  decoration: AppDecoration.fillPrimary
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder10),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _buildArrowSix(),
                                        SizedBox(height: 2.v),
                                        _buildMale(),
                                        SizedBox(height: 1.v),
                                        _buildCheckmark(),
                                        _buildValue1(),
                                        SizedBox(height: 4.v),
                                        _buildIndonesianTeacher(),
                                        SizedBox(height: 2.v),
                                        _buildEmail1(),
                                        SizedBox(height: 1.v),
                                        _buildTwelveMillionThreeHundredForty(),
                                        SizedBox(height: 11.v)
                                      ]))
                            ])))))));
  }

  /// Section Widget
  Widget _buildArrowSix() {
    return CustomFloatingTextField(
        controller: controller.arrowSixController,
        labelText: "lbl_nama".tr,
        labelStyle: theme.textTheme.titleSmall!,
        hintText: "lbl_nama".tr);
  }

  /// Section Widget
  Widget _buildMale() {
    return SizedBox(
        height: 55.v,
        width: 329.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Text("lbl_gender2".tr,
                      style: theme.textTheme.titleSmall))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: 19.v),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 35.v,
                            width: 140.h,
                            margin: EdgeInsets.only(bottom: 1.v),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.h, vertical: 6.v),
                            decoration: AppDecoration.fillBluegray10001,
                            child:
                                Stack(alignment: Alignment.topLeft, children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgCheckmark,
                                  height: 18.v,
                                  width: 25.h,
                                  alignment: Alignment.topLeft),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Obx(() => Padding(
                                      padding: EdgeInsets.only(left: 2.h),
                                      child: CustomRadioButton(
                                          text: "lbl_male".tr,
                                          value: "lbl_male".tr,
                                          groupValue:
                                              controller.radioGroup.value,
                                          onChange: (value) {
                                            controller.radioGroup.value = value;
                                          }))))
                            ])),
                        Obx(() => CustomRadioButton(
                            text: "lbl_female".tr,
                            value: "lbl_female".tr,
                            groupValue: controller.radioGroup1.value,
                            padding: EdgeInsets.fromLTRB(12.h, 5.v, 30.h, 5.v),
                            onChange: (value) {
                              controller.radioGroup1.value = value;
                            }))
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildCheckmark() {
    return SizedBox(
        height: 54.v,
        width: 329.h,
        child: Stack(alignment: Alignment.topLeft, children: [
          CustomDropDown(
              width: 329.h,
              icon: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 9.v, 13.h, 9.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCheckmark,
                      height: 10.v,
                      width: 15.h)),
              hintText: "msg_03_december_2000".tr,
              alignment: Alignment.bottomCenter,
              items:
                  controller.editProfileModelObj.value.dropdownItemList!.value,
              borderDecoration: DropDownStyleHelper.fillBlueGray,
              fillColor: appTheme.blueGray10001,
              onChanged: (value) {
                controller.onSelected(value);
              }),
          Align(
              alignment: Alignment.topLeft,
              child: Text("lbl_date_of_birth2".tr,
                  style: theme.textTheme.titleSmall))
        ]));
  }

  /// Section Widget
  Widget _buildValue() {
    return CustomTextFormField(
        width: 329.h,
        controller: controller.valueController,
        hintText: "lbl_089602016687".tr,
        textInputType: TextInputType.phone,
        alignment: Alignment.bottomCenter,
        validator: (value) {
          if (!isValidPhone(value)) {
            return "err_msg_please_enter_valid_phone_number".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildValue1() {
    return SizedBox(
        height: 54.v,
        width: 329.h,
        child: Stack(alignment: Alignment.topLeft, children: [
          _buildValue(),
          Align(
              alignment: Alignment.topLeft,
              child: Text("lbl_phone_number2".tr,
                  style: theme.textTheme.titleSmall))
        ]));
  }

  /// Section Widget
  Widget _buildIndonesianteacher() {
    return CustomTextFormField(
        width: 329.h,
        controller: controller.indonesianteacherController,
        hintText: "msg_indonesian_teacher".tr,
        alignment: Alignment.bottomCenter);
  }

  /// Section Widget
  Widget _buildIndonesianTeacher() {
    return SizedBox(
        height: 52.v,
        width: 329.h,
        child: Stack(alignment: Alignment.topLeft, children: [
          _buildIndonesianteacher(),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Text("lbl_occupation".tr,
                      style: theme.textTheme.titleSmall)))
        ]));
  }

  /// Section Widget
  Widget _buildEmail() {
    return CustomTextFormField(
        width: 329.h,
        controller: controller.emailController,
        hintText: "msg_amirul_gmail_com".tr,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.emailAddress,
        alignment: Alignment.bottomCenter,
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildEmail1() {
    return SizedBox(
        height: 54.v,
        width: 329.h,
        child: Stack(alignment: Alignment.topLeft, children: [
          _buildEmail(),
          Align(
              alignment: Alignment.topLeft,
              child: Text("lbl_email2".tr, style: theme.textTheme.titleSmall))
        ]));
  }

  /// Section Widget
  Widget _buildTwelveMillionThreeHundredForty() {
    return SizedBox(
        height: 54.v,
        width: 329.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 9.h, bottom: 7.v),
                  child: Text("lbl_12345678".tr,
                      style: theme.textTheme.titleSmall))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 35.v,
                  width: 329.h,
                  decoration: BoxDecoration(color: appTheme.blueGray10001))),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Text("lbl_password3".tr,
                      style: theme.textTheme.titleSmall)))
        ]));
  }

  /// Navigates to the myProfileScreen when the action is triggered.
  onTapImgArrowSix() {
    Get.toNamed(
      AppRoutes.myProfileScreen,
    );
  }
}
