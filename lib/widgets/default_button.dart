import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    this.onTap,
    this.backgroundColor,
    this.textColor,
  });

  final String text;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 50,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor ?? Get.theme.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: Get.textTheme.titleLarge!.copyWith(
              fontFamily: 'Inika',
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
