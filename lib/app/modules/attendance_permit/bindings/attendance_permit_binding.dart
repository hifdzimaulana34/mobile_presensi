import 'package:get/get.dart';

import '../controllers/attendance_permit_controller.dart';

class AttendancePermitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendancePermitController>(
      () => AttendancePermitController(),
    );
  }
}
