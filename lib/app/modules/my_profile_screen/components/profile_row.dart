import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hifdzi_s_application3/app/modules/my_profile_screen/controller/my_profile_controller.dart';

import '../../../../theme/theme_helper.dart';
import '../../../../widgets/input_builder.dart';
import '../../../../widgets/input_date_picker.dart';

class ProfileRow extends GetView<MyProfileController> {
  const ProfileRow({
    super.key,
    required this.text,
    required this.name,
    this.isDateTime = false,
    this.isPassword = false,
    this.showPassword = false,
    this.canEdit = false,
  });
  final String text;
  final String name;
  final bool isDateTime;
  final bool isPassword;
  final bool showPassword;
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '$text : ',
                style: TextStyle(
                  fontFamily: 'Inika',
                  fontWeight: FontWeight.w700,
                  color: appTheme.black900,
                  // fontSize: 10,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: isDateTime
              ? InputDatePicker(
                  enabled: canEdit,
                  name: name,
                  hintText: '',
                  border: OutlineInputBorder(),
                )
              : InputBuilder(
                  enabled: canEdit,
                  name: name,
                  maskText: showPassword,
                  suffixIcon: isPassword
                      ? IconButton(
                          onPressed: () {
                            controller.isShowPassword.value = !controller.isShowPassword.value;
                          },
                          icon: Icon(
                            controller.isShowPassword.value ? Icons.visibility_off : Icons.visibility,
                          ),
                        )
                      : null,
                  border: OutlineInputBorder(),
                ),
        ),
      ],
    );
  }
}
