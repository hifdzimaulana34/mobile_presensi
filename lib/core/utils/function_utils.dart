import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void logKey([key, content]) {
  String finalLog = '';
  dynamic tempContent = content ?? key;
  if (tempContent is Map || tempContent is List) {
    try {
      finalLog = json.encode(tempContent);
    } catch (e) {
      finalLog = tempContent.toString();
    }
  } else if (tempContent is String) {
    finalLog = tempContent;
  } else {
    finalLog = tempContent.toString();
  }

  if (content != null) {
    dev.log('$key => $finalLog');
  } else {
    dev.log(finalLog);
  }
}

Widget loadingCircle({double? size}) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: (size ?? 50) * 2,
          width: (size ?? 50) * 2,
          // color: kBgWhite,
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}

void dialogLoading({double? size}) {
  Get.dialog(
    loadingCircle(size: size),
    // loading(size: size),
    barrierDismissible: false,
  );
}
