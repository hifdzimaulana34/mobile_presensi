import 'package:hifdzi_s_application3/app/routes/app_pages.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';

import '../models/splash_model.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        Routes.WELCOME_SCREEN,
      );
    });
  }
}
