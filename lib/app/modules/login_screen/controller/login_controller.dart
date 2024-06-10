import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';

import '../models/login_model.dart';

/// A controller class for the LoginScreen.
///
/// This class manages the state of the LoginScreen, including the
/// current loginModelObj
class LoginController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;

  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    passwordController.dispose();
  }
}
