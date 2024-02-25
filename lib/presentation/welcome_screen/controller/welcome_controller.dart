import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/presentation/welcome_screen/models/welcome_model.dart';

/// A controller class for the WelcomeScreen.
///
/// This class manages the state of the WelcomeScreen, including the
/// current welcomeModelObj
class WelcomeController extends GetxController {
  Rx<WelcomeModel> welcomeModelObj = WelcomeModel().obs;
}
