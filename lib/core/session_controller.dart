import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:hifdzi_s_application3/app/routes/app_pages.dart';
import 'package:hifdzi_s_application3/data/models/user.dart';

import 'network/network_controller.dart';
import 'utils/environtment.dart';
import 'utils/function_utils.dart';

class SessionController extends GetxController {
  final box = GetStorage();
  final user = User.empty().obs;
  final networkC = Get.find<NetworkController>();

  Future<User?> getUser() async {
    try {
      final Response res = await networkC.get(
        '$url/auth/user',
        useAuth: true,
      );
      if (!res.data['success']) {
        return null;
      }
      user.value = User.fromJson(res.data['data']);
      logKey('user', user.value.toJson());
      return user.value;
    } on DioException catch (e) {
      // logKey('error getUser type', e.type);
      logKey('error getUser', e.response?.data);
      logKey('error getUser', e.response == null);
      // logKey('error getUser message', e.message);
      if (e.response?.data is String) {
        return null;
      }
      if (e.response?.data['message'] == 'Unauthenticated') {
        await box.remove('token');
        await Get.snackbar('Session Expired', '');
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> logout() async {
    try {
      final Response res = await networkC.post(
        '$url/auth/logout',
        isFormData: false,
        useAuth: true,
      );
      logKey('res logout', res.data);
      await box.remove('token');
      Get.offAllNamed(Routes.LOGIN_SCREEN);
    } on DioException catch (e) {
      logKey('error logout', e.response);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
