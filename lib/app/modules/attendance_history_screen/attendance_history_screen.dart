import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:intl/intl.dart';

import 'components/attendance_history_row.dart';
import 'controller/attendance_history_controller.dart';

class AttendanceHistoryScreen extends GetView<AttendanceHistoryController> {
  const AttendanceHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 50.v),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Container(
            //     height: 50,
            //     width: 50,
            //     child: Image.asset(
            //       ImageConstant.imgProfileFreeVe,
            //     ),
            //   ),
            // ),
            Text("msg_attendance_history".tr, style: theme.textTheme.headlineLarge),
            SizedBox(height: 7.v),
            _buildTen(),
            SizedBox(height: 9.v),
            Container(
              height: Get.height - 300,
              margin: EdgeInsets.symmetric(horizontal: 7.h),
              decoration: AppDecoration.fillBluegray10001,
              child: Column(
                children: [
                  Container(
                    child: AttendanceHistoryRow(
                      isHeader: true,
                      data1: 'Date',
                      data2: 'Clock In',
                      data3: 'Clock Out',
                      data4: "Working Hr's",
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => ListView.separated(
                        shrinkWrap: true,
                        // physics: BouncingScrollPhysics(),
                        itemCount: controller.temp.length,
                        separatorBuilder: (context, index) {
                          return Container(
                            color: Colors.black,
                            height: 1,
                          );
                        },
                        itemBuilder: (context, index) {
                          final data = controller.temp[index];
                          return AttendanceHistoryRow(
                            data1: data.date,
                            data2: data.clockIn,
                            data3: data.clockOut,
                            data4: data.workhour.toString(),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        actions: [AppbarTrailingImage(imagePath: ImageConstant.imgProfileFreeVe, margin: EdgeInsets.symmetric(horizontal: 15.h, vertical: 3.v))]);
  }

  /// Section Widget
  Widget _buildTen() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 88.h, vertical: 11.v),
      decoration: AppDecoration.fillBlack,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CustomImageView(
          //   imagePath: ImageConstant.imgArrowLeft,
          //   height: 15.v,
          //   width: 10.h,
          //   margin: EdgeInsets.only(top: 3.v, bottom: 5.v),
          //   onTap: () {
          //     onTapImgArrowLeft();
          //   },
          // ),
          GestureDetector(
            onTap: () {
              controller.switchMonth(false);
            },
            child: Container(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 1.v),
            child: Obx(
              () => GestureDetector(
                onTap: () {
                  controller.monthPicker();
                },
                child: Expanded(
                  child: Container(
                    child: Text(
                      // "lbl_january_2024".tr,
                      '${DateFormat('MMM').format(DateTime(0, controller.currentMonth.value))} ${controller.currentYear.value}',
                      style: CustomTextStyles.titleLargeRegular,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.switchMonth(true);
            },
            child: Container(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
          // CustomImageView(
          //   imagePath: ImageConstant.imgArrowLeft,
          //   height: 15.v,
          //   width: 10.h,
          //   margin: EdgeInsets.only(
          //     top: 3.v,
          //     right: 1.h,
          //     bottom: 5.v,
          //   ),
          // )
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }
}
