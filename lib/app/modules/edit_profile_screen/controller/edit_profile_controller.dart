import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';

import '../models/edit_profile_model.dart';

/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {
  TextEditingController arrowSixController = TextEditingController();

  TextEditingController valueController = TextEditingController();

  TextEditingController indonesianteacherController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;

  Rx<String> radioGroup = "".obs;

  Rx<String> radioGroup1 = "".obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onClose() {
    super.onClose();
    arrowSixController.dispose();
    valueController.dispose();
    indonesianteacherController.dispose();
    emailController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in editProfileModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    editProfileModelObj.value.dropdownItemList.refresh();
  }
}
