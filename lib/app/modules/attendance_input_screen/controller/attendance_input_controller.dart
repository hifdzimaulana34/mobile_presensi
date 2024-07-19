import 'package:dio/dio.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/network/network_controller.dart';
import 'package:hifdzi_s_application3/core/utils/environtment.dart';
import 'package:hifdzi_s_application3/core/utils/function_utils.dart';
import 'package:hifdzi_s_application3/data/models/schedule.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../routes/app_pages.dart';
import '../models/attendance_input_model.dart';

/// A controller class for the AttendanceInputScreen.
///
/// This class manages the state of the AttendanceInputScreen, including the
/// current attendanceInputModelObj
class AttendanceInputController extends GetxController {
  Rx<AttendanceInputModel> attendanceInputModelObj = AttendanceInputModel().obs;

  final networkC = Get.find<NetworkController>();

  final listSchedule = <Schedule>[].obs;

  final isLoading = true.obs;

  Future<void> getSchedules() async {
    try {
      final Response res = await networkC.get(
        '$url/attendances/list-schedule',
        useAuth: true,
      );
      logKey('res getSchedules', res.data);
      final schedules = res.data['data'];
      for (var schedule in schedules) {
        final temp = Schedule.fromJson(schedule);
        listSchedule.add(temp);
      }
    } on DioException catch (e) {
      logKey('error getSchedules', e.response);
    }
  }

  void initFunction() async {
    await getSchedules();
    isLoading.value = false;
  }

  onTapImgImage(Schedule data) async {
    // final _cameras = await availableCameras();
    // logKey('_cameras',_cameras[1]);
    final cameraAccess = await Permission.camera.status;
    logKey('cameraAccess',cameraAccess);
    Get.toNamed(
      Routes.TAKE_A_SELFIE_SCREEN,
      arguments: {
        'company_id': 1,
        'schedule_presence_id': data.id,
        // 'cameras': _cameras,
        'camera_access': cameraAccess.isGranted,
      },
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initFunction();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
