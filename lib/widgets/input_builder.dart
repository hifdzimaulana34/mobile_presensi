import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';

class InputBuilder extends StatelessWidget {
  const InputBuilder({
    super.key,
    required this.name,
    this.textAlign = TextAlign.start,
    this.maskText = false,
    this.isPhone = false,
    this.isNumber = false,
    this.keyboardType = TextInputType.text,
    this.autoValidate = AutovalidateMode.always,
    this.isRequired = false,
    this.isEmail = false,
    this.textStyle,
    this.hintText = '',
    this.prefixIcon,
    this.suffixIcon,
    this.border,
  });

  final String name;
  final TextAlign textAlign;
  final bool maskText;
  final bool isPhone;
  final bool isNumber;
  final TextInputType keyboardType;

  //* validator
  final AutovalidateMode autoValidate;
  final bool isRequired;
  final bool isEmail;

  //* textStyle
  final TextStyle? textStyle;

  //* inputDecoration
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      textAlign: textAlign,
      obscureText: maskText,
      keyboardType: isPhone || isNumber ? TextInputType.number : keyboardType,
      autovalidateMode: autoValidate,
      validator: FormBuilderValidators.compose([
        if (isRequired) FormBuilderValidators.required(),
        if (isEmail) FormBuilderValidators.email(),
        // if (isVerifPass) FormBuilderValidators.equal(context, value != null ? value! : '', errorText: 'Value must be equal to password'),
      ]),
      // style: TextStyle(
      //   color: textColor != null ? textColor : Colors.black87,
      //   fontSize: 14,
      // ),

      style: textStyle ?? Get.theme.textTheme.bodyLarge,
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

final defaultInputDecoration = InputDecoration();
