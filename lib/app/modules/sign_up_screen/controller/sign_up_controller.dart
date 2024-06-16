import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/network/network_controller.dart';
import 'package:hifdzi_s_application3/core/utils/environtment.dart';
import 'package:hifdzi_s_application3/core/utils/function_utils.dart';

import '../../../routes/app_pages.dart';
import '../models/sign_up_model.dart';

/// A controller class for the SignUpScreen.
///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpController extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  final networkC = Get.find<NetworkController>();

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    dateOfBirthController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in signUpModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    signUpModelObj.value.dropdownItemList.refresh();
  }

  void onTapSignUp() async {
    String name = fullNameController.text;
    String password = passwordController.text;
    String email = emailController.text;
    String phone = phoneNumberController.text;

    // Construct the URL of your PHP script
    // String url = 'http://192.168.0.107/testingphp/register.php';

    // Create a map containing the form data
    Map<String, String> formData = {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    };

    final _url = '$url/register';

    // Send the HTTP POST request
    // try {
    //   http.Response response = await http.post(Uri.parse(url), body: formData);
    //   // Check the response from the server
    //   if (response.statusCode == 200) {
    //     // Successful registration
    //     print('Registration successful');
    //     Get.toNamed(
    //       Routes.WELCOME_SCREEN,
    //     );
    //     // You can handle the response further if needed
    //   } else {
    //     // Registration failed
    //     print('Registration failed: ${response.body}');
    //     // You can handle the failure scenario here
    //   }
    // } catch (error) {
    //   print('Error sending request: $error');
    //   // Handle the error scenario here
    // }

    try {
      final Response res = await networkC.post(
        _url,
        param: formData,
      );
      if (res.statusCode != 200) {
        logKey('error', res.data);
        return;
      }
      Get.toNamed(Routes.WELCOME_SCREEN);
    } on DioException catch (e) {
      logKey('error onTapSignUp $_url', e.message);
      logKey('error onTapSignUp $_url param', e.requestOptions.queryParameters);
      // logKey('error onTapSignUp $_url', formData);
    }
  }

  Future<void> testApi() async {
    try {
      final Response res = await networkC.get(
        url,
      );
      logKey('res testApi', res.data);
    } on DioException catch (e) {
      logKey('error testApi ', e.message);
    }
  }

  onTapArrowTwo() {
    Get.toNamed(
      Routes.WELCOME_SCREEN,
    );
  }
}
