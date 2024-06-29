import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../models/attendance_history_model.dart';

/// A controller class for the AttendanceHistoryScreen.
///
/// This class manages the state of the AttendanceHistoryScreen, including the
/// current attendanceHistoryModelObj
class AttendanceHistoryController extends GetxController {
  Rx<AttendanceHistoryModel> attendanceHistoryModelObj = AttendanceHistoryModel().obs;
  final temp = <Attendance>[].obs;
  final currentMonth = 1.obs;
  final currentYear = 2024.obs;

  void insertDummyAttendance() {
    List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    for (var i = 0; i < 15; i++) {
      final attendance = Attendance(
        date: '${i + 1} ${daysOfWeek[(i + 1) % 7]}',
        clockIn: '08:00 am',
        clockOut: '04:00 pm',
        workhour: 8,
      );
      temp.add(attendance);
    }
  }

  void monthPicker() async {
    final res = await showMonthPicker(
      context: Get.context!,
      initialDate: DateTime(currentYear.value, currentMonth.value),
    );
    if (res == null) {
      return;
    }
    currentMonth.value = res.month;
    currentYear.value = res.year;
  }

  void switchMonth(bool isIncrement) {
    if (isIncrement) {
      if (currentMonth.value == 12) {
        currentMonth.value = 1;
        currentYear.value++;
        return;
      }
      currentMonth.value++;
    } else {
      if (currentMonth.value == 1) {
        currentMonth.value = 12;
        currentYear.value--;
        return;
      }
      currentMonth.value--;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    insertDummyAttendance();
  }
}

class Attendance {
  Attendance({
    required this.date,
    required this.clockIn,
    required this.clockOut,
    required this.workhour,
  });

  final String date;
  final String clockIn;
  final String clockOut;
  final int workhour;

  Map<String, dynamic> toJson() => {
        'date': date,
        'clock_in': clockIn,
        'clock_out': clockOut,
        'workhour': workhour,
      };

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        date: json['date'],
        clockIn: json['clock_in'],
        clockOut: json['clock_out'],
        workhour: json['workhour'],
      );
}
