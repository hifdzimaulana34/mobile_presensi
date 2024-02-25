import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the MyProfileScreen.
///
/// This class manages the state of the MyProfileScreen, including the
/// current myProfileModelObj
class MyProfileController extends GetxController {
  TextEditingController profileImageController = TextEditingController();

  TextEditingController genderValueController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController occupationValueController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<MyProfileModel> myProfileModelObj = MyProfileModel().obs;

  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    profileImageController.dispose();
    genderValueController.dispose();
    dateOfBirthController.dispose();
    phoneNumberController.dispose();
    occupationValueController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
