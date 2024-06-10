import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';

import '../models/new_password_model.dart';

/// A controller class for the NewPasswordScreen.
///
/// This class manages the state of the NewPasswordScreen, including the
/// current newPasswordModelObj
class NewPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  Rx<NewPasswordModel> newPasswordModelObj = NewPasswordModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }
}
