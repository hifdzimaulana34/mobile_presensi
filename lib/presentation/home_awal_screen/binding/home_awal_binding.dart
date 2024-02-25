import '../controller/home_awal_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HomeAwalScreen.
///
/// This class ensures that the HomeAwalController is created when the
/// HomeAwalScreen is first loaded.
class HomeAwalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeAwalController());
  }
}
