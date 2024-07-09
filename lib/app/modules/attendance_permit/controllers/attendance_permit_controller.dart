import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/network/network_controller.dart';
import 'package:hifdzi_s_application3/core/utils/environtment.dart';
import 'package:hifdzi_s_application3/core/utils/function_utils.dart';

class AttendancePermitController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final listPermit = ['Permission', 'Sick'];
  final isPermission = true.obs;

  final networkC = Get.find<NetworkController>();

  final attachmentPath = ''.obs;

  Future<void> chooseFile() async {
    final res = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png', 'doc', 'docx'],
      allowMultiple: false,
    );
    if (res == null || res.files.isEmpty) {
      return;
    }
    attachmentPath.value = res.paths.first!;
  }

  Future<void> createAttendancePermit() async {
    formKey.currentState!.saveAndValidate();
    final DateTime _startDate = formKey.currentState!.value['start_date'];
    final DateTime _endDate = formKey.currentState!.value['end_date'];
    // return;
    dialogLoading();
    final data = {
      'company_id': 1,
      'type': isPermission.value ? listPermit.first : listPermit.last,
      'start_date': _startDate.format('yyyy/MM/dd').replaceAll('/', '-'),
      'end_date': _endDate.format('yyyy/MM/dd').replaceAll('/', '-'),
      // 'attachment': http.MultipartFile.fromBytes();
      'attachment': MultipartFile.fromFileSync(
        attachmentPath.value,
        // filename: attachmentPath.value.split('/').last,
      ),
    };
    logKey('data', data);

    try {
      final Response res = await networkC.post(
        '$url/permits',
        isFormData: true,
        useAuth: true,
        body: FormData.fromMap(data),
      );
      logKey('res createAttendancePermit', res.statusCode);
      Get.close(2);
    } on DioException catch (e) {
      logKey('error createAttendancePermit', e);
      Get.back();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void saveAttendance() {
    Get.back();
  }
}
