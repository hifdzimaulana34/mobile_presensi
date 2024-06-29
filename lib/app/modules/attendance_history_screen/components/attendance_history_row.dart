import 'package:flutter/material.dart';

import '../../../../theme/theme_helper.dart';

class AttendanceHistoryRow extends StatelessWidget {
  AttendanceHistoryRow({
    required this.data1,
    required this.data2,
    required this.data3,
    required this.data4,
    this.isHeader = false,
  });
  final String data1;
  final String data2;
  final String data3;
  final String data4;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 55,
            color: isHeader ? Colors.black : Color(0xFFB9B9B9),
            child: Center(
              child: Center(
                child: Text(
                  // 'Date',
                  data1,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w500,
                    color: isHeader ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 55,
            color: isHeader ? Colors.black : appTheme.blueGray10001,
            child: Center(
              child: Text(
                // 'Clock In',
                data2,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 55,
            color: isHeader ? Colors.black : Color(0xFFB9B9B9),
            child: Center(
              child: Text(
                // 'Clock Out',
                data3,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 55,
            color: isHeader ? Colors.black : appTheme.blueGray10001,
            child: Center(
              child: Text(
                // "Working Hr's",
                data4,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.white : Colors.black,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
