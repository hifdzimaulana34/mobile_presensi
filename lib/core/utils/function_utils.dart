import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

String? testTimeConvert(String stringTime) {
  try {
    final dateTime = DateFormat('HH:mm:ss').parse(stringTime);
    final res = DateFormat('h:mm a').format(dateTime);
    return res;
  } catch (e) {
    return null;
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

void dialogLoading({double? size, bool barrierDismissible = false}) {
  Get.dialog(
    PopScope(
      canPop: barrierDismissible,
      child: loadingCircle(size: size),
    ),
    // loading(size: size),
    barrierDismissible: barrierDismissible,
  );
}
