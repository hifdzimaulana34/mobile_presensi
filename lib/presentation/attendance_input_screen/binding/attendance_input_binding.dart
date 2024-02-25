import '../controller/attendance_input_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AttendanceInputScreen.
///
/// This class ensures that the AttendanceInputController is created when the
/// AttendanceInputScreen is first loaded.
class AttendanceInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendanceInputController());
  }
}
