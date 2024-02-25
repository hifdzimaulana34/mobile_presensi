import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/presentation/attendance_history_screen/models/attendance_history_model.dart';

/// A controller class for the AttendanceHistoryScreen.
///
/// This class manages the state of the AttendanceHistoryScreen, including the
/// current attendanceHistoryModelObj
class AttendanceHistoryController extends GetxController {
  Rx<AttendanceHistoryModel> attendanceHistoryModelObj =
      AttendanceHistoryModel().obs;
}
