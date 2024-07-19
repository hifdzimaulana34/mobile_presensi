import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/utils/function_utils.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hifdzi_s_application3/widgets/app_bar/custom_app_bar.dart';

import 'controller/attendance_input_controller.dart';

class AttendanceInputScreen extends GetWidget<AttendanceInputController> {
  const AttendanceInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 19.v),
          child: Column(
            children: [
              Text("msg_attendance_input".tr, style: theme.textTheme.headlineLarge),
              SizedBox(height: 60.v),
              // _buildAttendanceInput(),
              Obx(
                () => controller.isLoading.value
                    ? CircularProgressIndicator()
                    : !controller.isLoading.value && controller.listSchedule.isEmpty
                        ? Text(
                            'Empty schedules',
                          )
                        : Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: controller.listSchedule.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 10);
                              },
                              itemBuilder: (context, index) {
                                final data = controller.listSchedule[index];
                                return GestureDetector(
                                  onTap: () {
                                    controller.onTapImgImage(data);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                                    decoration: AppDecoration.fillPrimary,
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 1.h, top: 3.v, bottom: 7.v),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // "lbl_clock_in".tr,
                                                data.name,
                                                style: CustomTextStyles.headlineSmallTajawalBlack900,
                                              ),
                                              SizedBox(height: 1.v),
                                              Text(
                                                // "lbl_at_7_am_to_9_am".tr,
                                                'at ${testTimeConvert(data.startTime) ?? ''} to ${testTimeConvert(data.endTime) ?? ''}',
                                                style: CustomTextStyles.titleLargeff000000,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Container(
                                            child: Image.asset(
                                              ImageConstant.img,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        actions: [AppbarTrailingImage(imagePath: ImageConstant.imgProfileFreeVe, margin: EdgeInsets.symmetric(horizontal: 14.h, vertical: 3.v))]);
  }
}
