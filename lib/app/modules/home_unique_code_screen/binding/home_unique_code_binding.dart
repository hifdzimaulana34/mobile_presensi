import '../controller/home_unique_code_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HomeUniqueCodeScreen.
///
/// This class ensures that the HomeUniqueCodeController is created when the
/// HomeUniqueCodeScreen is first loaded.
class HomeUniqueCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeUniqueCodeController());
  }
}
