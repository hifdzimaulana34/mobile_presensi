import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hifdzi_s_application3/app/routes/app_pages.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/utils/function_utils.dart';
import 'package:hifdzi_s_application3/core/utils/validation_functions.dart';
import 'package:hifdzi_s_application3/widgets/custom_text_form_field.dart';

import 'components/profile_row.dart';
import 'controller/my_profile_controller.dart';

// ignore_for_file: must_be_immutable
class MyProfileScreen extends GetWidget<MyProfileController> {
  MyProfileScreen({Key? key}) : super(key: key);

  // GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("lbl_my_profile".tr, style: theme.textTheme.headlineLarge),
              SizedBox(height: 4.v),
              SizedBox(
                height: 120.v,
                width: 131.h,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CustomImageView(imagePath: ImageConstant.imgProfileFreeVe, height: 120.v, width: 119.h, alignment: Alignment.centerLeft),
                    // Align(
                    //   alignment: Alignment.bottomRight,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       controller.isEditMode.value = !controller.isEditMode.value;
                    //     },
                    //     child: Container(
                    //       height: 38.v,
                    //       width: 50.h,
                    //       padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 7.v),
                    //       decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                    //         borderRadius: BorderRadiusStyle.roundedBorder10,
                    //       ),
                    //       child: Obx(
                    //         () => Icon(
                    //           controller.isEditMode.value ? Icons.edit : Icons.edit_off,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 15.v),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FormBuilder(
                  key: controller.formKey,
                  initialValue: controller.temp.value,
                  child: Column(
                    children: [
                      Obx(
                        () => ProfileRow(
                          text: 'Name',
                          name: 'name',
                          canEdit: controller.isEditMode.value,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ProfileRow(
                        text: 'Email',
                        name: 'email',
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => ProfileRow(
                          text: 'Phone',
                          name: 'phone',
                          canEdit: controller.isEditMode.value,
                        ),
                      ),
                      // ProfileRow(
                      //   text: 'Gender',
                      //   name: 'gender',
                      // ),
                      const SizedBox(height: 10),
                      Obx(
                        () => ProfileRow(
                          text: 'Date of birth',
                          name: 'date_of_birth',
                          isDateTime: true,
                          canEdit: controller.isEditMode.value,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // const SizedBox(height: 10),
                      // ProfileRow(
                      //   text: 'Kategori',
                      //   name: 'category',
                      // ),
                      // ProfileRow(
                      //   text: 'ID Pegawai',
                      //   name: 'id',
                      // ),
                      // const SizedBox(height: 10),

                      // const SizedBox(height: 10),
                      // ProfileRow(
                      //   text: 'Password',
                      //   name: 'password',
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // controller.editProfile();
                          Get.toNamed(Routes.CHANGE_PASSWORD);
                        },
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Change Password',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if (controller.isLoadingEdit.value) {
                            return;
                          }
                          if (controller.isEditMode.value) {
                            await controller.editProfile();
                          }
                          controller.isEditMode.value = !controller.isEditMode.value;
                          logKey('controller.isEditMode.value', controller.isEditMode.value);
                        },
                        child: Obx(
                          () => Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              color: controller.isEditMode.value ? PrimaryColors().greenA200 : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: controller.isLoadingEdit.value
                                  ? CircularProgressIndicator()
                                  : Text(
                                      controller.isEditMode.value ? 'Save' : 'Edit Profile',
                                      style: TextStyle(color: Colors.black),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.v),
              GestureDetector(
                onTap: () {
                  controller.sessioC.logout();
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Get.theme.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 250),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileImage() {
    return CustomTextFormField(width: 191.h, controller: controller.profileImageController, hintText: "lbl_amirul_yusuf".tr);
  }

  /// Section Widget
  // Widget _buildProfileStack() {
  //   return Padding(
  //     padding: EdgeInsets.only(left: 5.h),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.only(top: 3.v, bottom: 6.v),
  //           child: Text(
  //             "lbl_nama".tr,
  //             style: theme.textTheme.titleSmall,
  //           ),
  //         ),
  //         // _buildProfileImage(),
  //       ],
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildGenderValue() {
    return CustomTextFormField(width: 191.h, controller: controller.genderValueController, hintText: "lbl_male".tr);
  }

  /// Section Widget
  Widget _buildNameRow() {
    return Padding(
      padding: EdgeInsets.only(left: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 10.v), child: Text("lbl_gender2".tr, style: theme.textTheme.titleSmall)),
          _buildGenderValue(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDateOfBirth() {
    return CustomTextFormField(width: 191.h, controller: controller.dateOfBirthController, hintText: "msg_03_december_2000".tr);
  }

  /// Section Widget
  Widget _buildDateOfBirthRow() {
    return Padding(
      padding: EdgeInsets.only(left: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 9.v), child: Text("lbl_date_of_birth2".tr, style: theme.textTheme.titleSmall)),
          _buildDateOfBirth(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber() {
    return CustomTextFormField(
        width: 191.h,
        controller: controller.phoneNumberController,
        hintText: "lbl_089602016687".tr,
        textInputType: TextInputType.phone,
        validator: (value) {
          if (!isValidPhone(value)) {
            return "err_msg_please_enter_valid_phone_number".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildPhoneNumberRow() {
    return Padding(
        padding: EdgeInsets.only(left: 5.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.only(bottom: 10.v), child: Text("lbl_phone_number2".tr, style: theme.textTheme.titleSmall)),
          _buildPhoneNumber()
        ]));
  }

  /// Section Widget
  Widget _buildOccupationValue() {
    return CustomTextFormField(width: 191.h, controller: controller.occupationValueController, hintText: "msg_indonesian_teacher".tr);
  }

  /// Section Widget
  Widget _buildOccupationRow() {
    return Padding(
        padding: EdgeInsets.only(left: 5.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.only(top: 1.v, bottom: 8.v), child: Text("lbl_occupation".tr, style: theme.textTheme.titleSmall)),
          _buildOccupationValue()
        ]));
  }

  /// Section Widget
  Widget _buildEmail() {
    return CustomTextFormField(
        width: 191.h,
        controller: controller.emailController,
        hintText: "msg_amirul_gmail_com".tr,
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildEmailRow() {
    return Padding(
        padding: EdgeInsets.only(left: 5.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Padding(padding: EdgeInsets.only(bottom: 10.v), child: Text("lbl_email2".tr, style: theme.textTheme.titleSmall)), _buildEmail()]));
  }

  /// Section Widget
  Widget _buildPassword() {
    return Obx(() => CustomTextFormField(
        width: 191.h,
        controller: controller.passwordController,
        hintText: "lbl".tr,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        suffix: InkWell(
            onTap: () {
              controller.isShowPassword.value = !controller.isShowPassword.value;
            },
            child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 5.v, 8.h, 5.v), child: CustomImageView(imagePath: ImageConstant.imgEye, height: 20.v, width: 25.h))),
        suffixConstraints: BoxConstraints(maxHeight: 30.v),
        validator: (value) {
          if (value == null || (!isValidPassword(value, isRequired: true))) {
            return "err_msg_please_enter_valid_password".tr;
          }
          return null;
        },
        obscureText: controller.isShowPassword.value,
        contentPadding: EdgeInsets.only(left: 11.h, top: 5.v, bottom: 5.v)));
  }

  /// Section Widget
  Widget _buildPasswordRow() {
    return Padding(
        padding: EdgeInsets.only(left: 5.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.only(top: 2.v, bottom: 7.v), child: Text("lbl_password3".tr, style: theme.textTheme.titleSmall)),
          _buildPassword()
        ]));
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapBtnEdit() {
    Get.toNamed(
      Routes.EDIT_PROFILE_SCREEN,
    );
  }
}
