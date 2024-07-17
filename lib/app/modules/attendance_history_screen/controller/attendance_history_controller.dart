import 'package:dio/dio.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/network/network_controller.dart';
import 'package:hifdzi_s_application3/core/utils/environtment.dart';
import 'package:hifdzi_s_application3/core/utils/function_utils.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../models/attendance_history_model.dart';

/// A controller class for the AttendanceHistoryScreen.
///
/// This class manages the state of the AttendanceHistoryScreen, including the
/// current attendanceHistoryModelObj
class AttendanceHistoryController extends GetxController {
  Rx<AttendanceHistoryModel> attendanceHistoryModelObj = AttendanceHistoryModel().obs;
  final networkC = Get.find<NetworkController>();
  final temp = <Attendance>[].obs;
  final currentMonth = 1.obs;
  final currentYear = 2024.obs;

  final isLoading = true.obs;

  void insertDummyAttendance() {
    List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    for (var i = 0; i < 15; i++) {
      final attendance = Attendance(
        date: '${i + 1} ${daysOfWeek[(i + 1) % 7]}',
        schedule1: '08:00 am',
        schedule2: '04:00 pm',
        totalTime: "8",
      );
      temp.add(attendance);
    }
  }

  void monthPicker() async {
    if (isLoading.value) {
      return;
    }
    final res = await showMonthPicker(
      context: Get.context!,
      initialDate: DateTime(currentYear.value, currentMonth.value),
    );
    if (res == null) {
      return;
    }
    currentMonth.value = res.month;
    currentYear.value = res.year;
    temp.clear();
    await getAttendances();
  }

  void switchMonth(bool isIncrement) async {
    if (isLoading.value) {
      return;
    }
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
    temp.clear();
    await getAttendances();
  }

  void initialFunction() async {
    currentYear.value = DateTime.now().year;
    currentMonth.value = DateTime.now().month;
    await getAttendances();
    // insertDummyAttendance();
  }

  Future<void> getAttendances() async {
    isLoading.value = true;
    try {
      final Response res = await networkC.get(
        '$url/attendances?company_id=1&month=${currentYear.value}-${currentMonth.value}',
        useAuth: true,
      );
      logKey('res getAttendances', res.data);
      for (var e in res.data['data']['attendances']) {
        final _temp = Attendance.fromJson(e);
        temp.add(_temp);
      }
    } on DioException catch (e) {
      logKey('error getAttendances', e.response);
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialFunction();
  }
}

class Attendance {
  Attendance({
    required this.date,
    required this.schedule1,
    this.schedule2,
    required this.totalTime,
  });

  final String date;
  final String schedule1;
  final String? schedule2;
  final String totalTime;

  Map<String, dynamic> toJson() => {
        'date': date,
        'schedule1': schedule1,
        'schedule2': schedule2,
        'totalTime': totalTime,
      };

  factory Attendance.fromJson(Map<String, dynamic> json) {
    DateTime dateTime = DateFormat('EEE, dd MMMM yyyy').parse(json['date']);
    final formated = DateFormat('dd EEE').format(dateTime);
    return Attendance(
      date: formated,
      // date: DateFormat('dd EEE').format(),
      schedule1: json['schedule1'],
      schedule2: json['schedule2'] ?? '',
      totalTime: json['totalTime'] ?? "00 hours 00 minutes",
    );
  }
}
