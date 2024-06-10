import '../controller/take_a_selfie_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TakeASelfieScreen.
///
/// This class ensures that the TakeASelfieController is created when the
/// TakeASelfieScreen is first loaded.
class TakeASelfieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TakeASelfieController());
  }
}
