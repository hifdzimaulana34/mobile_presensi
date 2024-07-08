import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/network/network_controller.dart';
import 'package:hifdzi_s_application3/core/session_controller.dart';
import 'package:hifdzi_s_application3/core/utils/environtment.dart';
import 'package:hifdzi_s_application3/core/utils/function_utils.dart';

import '../../../routes/app_pages.dart';
import '../models/login_model.dart';

/// A controller class for the LoginScreen.
///
/// This class manages the state of the LoginScreen, including the
/// current loginModelObj
class LoginController extends GetxController {
  // TextEditingController nameController = TextEditingController();

  // TextEditingController passwordController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;

  Rx<bool> isShowPassword = true.obs;

  final networkC = Get.find<NetworkController>();
  final formKey = GlobalKey<FormBuilderState>();
  final isMaskPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> logIn() async {
    final isValidate = await formKey.currentState!.saveAndValidate();
    if (!isValidate) {
      return false;
    }
    final formData = formKey.currentState!.value;
    logKey('formData', formData);
    try {
      final Response res = await networkC.post(
        '$url/auth/login',
        body: {
          // ...formData,
          'email': formData['email'],
          'password': formData['password'],
        },
      );
      logKey('res logIn', res.data);
      await networkC.saveToken(res.data['data']['token']);
      return true;
    } on DioException catch (e) {
      logKey('error logIn', e.response);
      // logKey('error logIn data', e.response?.data);
      //* ini untuk close dialogLoading
      Get.back();
      if (e.response?.data != []) {
        Get.snackbar(
          'Error Login',
          '${e.response?.data?['message'] ?? ''}',
        );
      }
      return false;
    } catch (e) {
      logKey('error logIn other', e);
      return false;
    }
  }

  void onTapLOGIN() async {
    dialogLoading();
    final isLogin = await logIn();
    logKey('isLogin', isLogin);
    if (!isLogin) {
      return;
    }
    final sessionC = Get.find<SessionController>();
    final user = await sessionC.getUser();
    if (user == null) {
      Get.back();
      return;
    }
    Get.back();
    Get.offNamed(
      Routes.HOME_UNIQUE_CODE_SCREEN,
    );
    // String url = 'http://192.168.0.107/testingphp/login.php';
    // var response = await http.post(Uri.parse(url), body: {
    //   "name": name,
    //   "password": pass,
    // });

    // print("Server Response: ${response.body}");

    // try {
    //   var data = json.decode(response.body);
    //   if (data == "Success") {
    //     Fluttertoast.showToast(
    //         msg: "Login Success",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.green,
    //         textColor: Colors.white,
    //         fontSize: 16.0);

    //     Get.toNamed(Routes.HOME_AWAL_SCREEN);
    //   } else {
    //     Fluttertoast.showToast(
    //         msg: "Login Failed",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.white,
    //         fontSize: 16.0);
    //   }
    // } catch (e) {
    //   print("Error decoding JSON response: $e");
    //   Fluttertoast.showToast(
    //       msg: "Unexpected error occurred",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    // }

    // try {
    //   final Response res = await networkC.post(url, body: {
    //     'name': name,
    //     'password': pass,
    //   });
    //   logKey('res onTapLOGIN', res.data);
    //   Fluttertoast.showToast(
    //     msg: "Login Success",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.green,
    //     textColor: Colors.white,
    //     fontSize: 16.0,
    //   );
    //   Get.toNamed(Routes.HOME_AWAL_SCREEN);
    // } on DioException catch (e) {
    //   logKey('onTapLOGIN');
    //   Fluttertoast.showToast(
    //     msg: "Unexpected error occurred",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0,
    //   );
    // }
  }

  onTapTxtForgotThePassword() {
    Get.toNamed(
      Routes.FORGOT_PASSWORD_SCREEN,
    );
  }
}
