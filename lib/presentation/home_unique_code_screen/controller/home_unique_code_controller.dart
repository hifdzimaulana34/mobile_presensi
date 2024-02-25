import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/presentation/home_unique_code_screen/models/home_unique_code_model.dart';

/// A controller class for the HomeUniqueCodeScreen.
///
/// This class manages the state of the HomeUniqueCodeScreen, including the
/// current homeUniqueCodeModelObj
class HomeUniqueCodeController extends GetxController {
  Rx<HomeUniqueCodeModel> homeUniqueCodeModelObj = HomeUniqueCodeModel().obs;
}
