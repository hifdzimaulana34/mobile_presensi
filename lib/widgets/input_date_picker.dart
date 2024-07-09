import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class InputDatePicker extends StatelessWidget {
  const InputDatePicker({
    super.key,
    this.enabled = true,
    required this.name,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.border,
  });
  final bool enabled;
  final String name;

  //* inputDecoration
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      enabled: enabled,
      name: name,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: Get.theme.textTheme.bodyLarge,
        // isDense: true,
        // isCollapsed: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: border ??
            UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
        border: border,
      ),
    );
  }
}
