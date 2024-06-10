import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../models/verify_email_model.dart';

/// A controller class for the VerifyEmailScreen.
///
/// This class manages the state of the VerifyEmailScreen, including the
/// current verifyEmailModelObj
class VerifyEmailController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<VerifyEmailModel> verifyEmailModelObj = VerifyEmailModel().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}
