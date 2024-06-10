import '../controller/attendance_history_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AttendanceHistoryScreen.
///
/// This class ensures that the AttendanceHistoryController is created when the
/// AttendanceHistoryScreen is first loaded.
class AttendanceHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendanceHistoryController());
  }
}
