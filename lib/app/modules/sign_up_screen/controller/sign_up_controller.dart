import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';

import '../models/sign_up_model.dart';

/// A controller class for the SignUpScreen.
///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpController extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    dateOfBirthController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in signUpModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    signUpModelObj.value.dropdownItemList.refresh();
  }
}
