import 'package:hifdzi_s_application3/core/app_export.dart';

import '../../../routes/app_pages.dart';
import '../models/welcome_model.dart';

/// A controller class for the WelcomeScreen.
///
/// This class manages the state of the WelcomeScreen, including the
/// current welcomeModelObj
class WelcomeController extends GetxController {
  Rx<WelcomeModel> welcomeModelObj = WelcomeModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    final isExpired = Get.arguments['is_ession_expired'] ?? false;
    super.onReady();
    if (isExpired) {
      Get.snackbar('Session Expired', '');
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapLOGIN() {
    Get.toNamed(
      Routes.LOGIN_SCREEN,
      preventDuplicates: false,
    );
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapSIGNUP() {
    Get.toNamed(
      Routes.SIGN_UP_SCREEN,
    );
  }
}
