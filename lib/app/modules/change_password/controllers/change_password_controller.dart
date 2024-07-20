import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart' hide FormData, Response;
import 'package:hifdzi_s_application3/core/network/network_controller.dart';
import 'package:hifdzi_s_application3/core/session_controller.dart';
import 'package:hifdzi_s_application3/core/utils/environtment.dart';
import 'package:hifdzi_s_application3/core/utils/function_utils.dart';

class ChangePasswordController extends GetxController {
  final networkC = Get.find<NetworkController>();
  final sessionC = Get.find<SessionController>();

  final formKey = GlobalKey<FormBuilderState>();

  final isLoading = false.obs;

  final temp = ''.obs;
  final isMaskPassword = true.obs;

  void changePassword() async {
    final isValid = await formKey.currentState!.saveAndValidate();
    if (!isValid) {
      return;
    }
    isLoading.value = true;

    final data = {
      'name': sessionC.user.value.name,
      // 'gender': formKey.currentState!.value['gender'],
      'gender': sessionC.user.value.gender,
      'category': sessionC.user.value.categoryId,
      'email': sessionC.user.value.email,
      'phone': sessionC.user.value.phone,
      'password': formKey.currentState!.value['password'],
    };
    try {
      final Response res = await networkC.post(
        '$url/auth/update-profile',
        isFormData: true,
        useAuth: true,
        body: FormData.fromMap(data),
      );
      logKey('res changePassword', res.data);
      Get.defaultDialog(
        barrierDismissible: false,
        backgroundColor: Get.theme.primaryColor,
        middleText: 'Password has been changed',
        onWillPop: () async {
          return false;
        },
        title: 'Success',
        onConfirm: () {
          Get.close(2);
        },
      );
    } on DioException catch (e) {
      logKey('error changePassword', e.response);
    }
    isLoading.value = false;
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
}
