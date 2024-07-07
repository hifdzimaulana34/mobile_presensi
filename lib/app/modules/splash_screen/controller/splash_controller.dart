import 'package:get_storage/get_storage.dart';
import 'package:hifdzi_s_application3/app/routes/app_pages.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/session_controller.dart';
import 'package:hifdzi_s_application3/core/utils/function_utils.dart';

import '../models/splash_model.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;
  final box = GetStorage();

  void checkToken() async {
    // box.remove('token');
    final token = box.read('token') ?? '';
    if (token == '') {
      await Future.delayed(Duration(seconds: 3));
      Get.offNamed(
        Routes.WELCOME_SCREEN,
      );
      return;
    }
    final sessionC = Get.find<SessionController>();
    final user = await sessionC.getUser();
    if (user == null) {
      await Future.delayed(Duration(seconds: 3));
      Get.offNamed(
        Routes.WELCOME_SCREEN,
        arguments: {
          'is_session_expired': true,
        },
      );
      return;
    }
    logKey('session active', sessionC.user.toJson());
    logKey('session token', box.read('token'));
    await Future.delayed(Duration(seconds: 3));
    Get.offNamed(
      Routes.HOME_UNIQUE_CODE_SCREEN,
    );
  }

  @override
  void onReady() {
    checkToken();
  }
}
