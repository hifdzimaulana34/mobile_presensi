import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/widgets/input_builder.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('ChangePasswordView'),
      //   centerTitle: true,
      // ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: FormBuilder(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Text(
                'New password',
                style: CustomTextStyles.headlineSmallTajawal,
              ),
              const SizedBox(height: 10),
              Obx(
                () => InputBuilder(
                  name: 'password',
                  maskText: controller.isMaskPassword.value,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isMaskPassword.value = !controller.isMaskPassword.value;
                    },
                    icon: Icon(
                      controller.isMaskPassword.value ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  onChanged: (value) {
                    controller.temp.value = value ?? '';
                  },
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Re-type New password',
                style: CustomTextStyles.headlineSmallTajawal,
              ),
              Obx(
                () => InputBuilder(
                  name: 'confirm_password',
                  maskText: controller.isMaskPassword.value,
                  value: controller.temp.value,
                  border: OutlineInputBorder(),
                  isVerifPass: true,
                  autoValidate: AutovalidateMode.onUserInteraction,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isMaskPassword.value = !controller.isMaskPassword.value;
                    },
                    icon: Icon(
                      controller.isMaskPassword.value ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Obx(
                () => Center(
                  child: GestureDetector(
                    onTap: () {
                      controller.changePassword();
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: controller.isLoading.value
                            ? CircularProgressIndicator(color: Colors.white,)
                            : Text(
                                'Change Password',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
