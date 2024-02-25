import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/presentation/attendance_input_screen/models/attendance_input_model.dart';

/// A controller class for the AttendanceInputScreen.
///
/// This class manages the state of the AttendanceInputScreen, including the
/// current attendanceInputModelObj
class AttendanceInputController extends GetxController {
  Rx<AttendanceInputModel> attendanceInputModelObj = AttendanceInputModel().obs;
}
