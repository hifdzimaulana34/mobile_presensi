import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/network/network_controller.dart';
import 'package:hifdzi_s_application3/core/session_controller.dart';
import 'package:hifdzi_s_application3/core/utils/environtment.dart';
import 'package:hifdzi_s_application3/core/utils/function_utils.dart';
import 'package:intl/intl.dart';

import '../models/my_profile_model.dart';

/// A controller class for the MyProfileScreen.
///
/// This class manages the state of the MyProfileScreen, including the
/// current myProfileModelObj
class MyProfileController extends GetxController {
  TextEditingController profileImageController = TextEditingController();

  TextEditingController genderValueController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController occupationValueController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<MyProfileModel> myProfileModelObj = MyProfileModel().obs;

  Rx<bool> isShowPassword = true.obs;
  final isEditMode = false.obs;
  final isLoadingEdit = false.obs;

  final networkC = Get.find<NetworkController>();

  final formKey = GlobalKey<FormBuilderState>();

  final sessioC = Get.find<SessionController>();

  final temp = <String, dynamic>{}.obs;
  void initilFunction() {
    // formKey.currentState!.val;
    final user = sessioC.user.value;
    logKey('datee', user.dateOfBirth);
    temp.assignAll(
      {
        'name': user.name,
        'gender': user.gender,
        'date_of_birth': user.dateOfBirth != null ? DateTime.parse(user.dateOfBirth!) : DateTime.now(),
        'category': '${user.categoryId}',
        'id': '${user.nip}',
        'email': user.email,
        'phone': user.phone,
        // 'password': 'password',
      },
    );
  }

  Future<void> editProfile() async {
    isLoadingEdit.value = true;
    formKey.currentState!.saveAndValidate();
    final data = {
      'name': formKey.currentState!.value['name'],
      // 'gender': formKey.currentState!.value['gender'],
      'gender': sessioC.user.value.gender,
      'date_of_birth': '${DateFormat('yyyy-MM-dd').format(formKey.currentState!.value['date_of_birth'])}',
      'category': sessioC.user.value.categoryId,
      'email': formKey.currentState!.value['email'],
      'phone': formKey.currentState!.value['phone'],
    };
    logKey('zzz', formKey.currentState!.value);
    logKey('zzz', data);
    try {
      final Response res = await networkC.post(
        '$url/auth/update-profile',
        isFormData: true,
        useAuth: true,
        body: FormData.fromMap(data),
      );
      logKey('res editProfile', res.data);
      logKey('birth date', data['date_of_birth']);
      if (res.data?['success'] ?? false) {
        // isEditMode.value = false;
        Get.snackbar('Success', 'Profile has been updated');
      }
      sessioC.user.value.name = data['name'];
      sessioC.user.value.gender = data['gender'];
      sessioC.user.value.dateOfBirth = '${data['date_of_birth']}';
      sessioC.user.value.email = data['email'];
      sessioC.user.value.phone = data['phone'];
      // isLoadingEdit.value = false;
      // isEditMode.value = false;
    } on DioException catch (e) {
      logKey('error editProfile', e.response);
      Get.snackbar('Error', 'error edit profile');
    }
    isLoadingEdit.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initilFunction();
  }

  @override
  void onClose() {
    super.onClose();
    profileImageController.dispose();
    genderValueController.dispose();
    dateOfBirthController.dispose();
    phoneNumberController.dispose();
    occupationValueController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
