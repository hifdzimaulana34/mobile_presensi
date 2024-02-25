import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/presentation/take_a_selfie_screen/models/take_a_selfie_model.dart';

/// A controller class for the TakeASelfieScreen.
///
/// This class manages the state of the TakeASelfieScreen, including the
/// current takeASelfieModelObj
class TakeASelfieController extends GetxController {
  Rx<TakeASelfieModel> takeASelfieModelObj = TakeASelfieModel().obs;
}
