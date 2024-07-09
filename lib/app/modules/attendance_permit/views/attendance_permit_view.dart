import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/widgets/input_date_picker.dart';

import '../controllers/attendance_permit_controller.dart';

class AttendancePermitView extends GetView<AttendancePermitController> {
  const AttendancePermitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('AttendancePermitView'),
      //   centerTitle: true,
      // ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FormBuilder(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      ImageConstant.imgProfileFreeVe,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Attendance Permit',
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: PrimaryColors().blueGray10001,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.isPermission.value = !controller.isPermission.value;
                                  },
                                  child: Obx(
                                    () => Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: controller.isPermission.value ? Color(0xFFDDBE20) : Colors.transparent,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                SizedBox(
                                  height: 25,
                                  child: Text(
                                    'Permission',
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.isPermission.value = !controller.isPermission.value;
                                  },
                                  child: Obx(
                                    () => Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: !controller.isPermission.value ? Color(0xFF54A04E) : Colors.transparent,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                SizedBox(
                                  height: 25,
                                  child: Text(
                                    'Sick',
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // FormBuilderRadioGroup(
                      //   wrapAlignment: WrapAlignment.center,
                      //   name: 'type',
                      //   decoration: InputDecoration(
                      //     fillColor: Colors.amber,
                      //     border: InputBorder.none,
                      //   ),
                      //   options: [
                      //     FormBuilderFieldOption(
                      //       value: 'permission',
                      //       child: Text('Permission'),
                      //     ),
                      //     FormBuilderFieldOption(
                      //       value: 'sick',
                      //       child: Text('Sick'),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Start date :',
                              style: theme.textTheme.titleLarge!.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            flex: 2,
                            child: InputDatePicker(
                              name: 'start_date',
                              hintText: '',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'End Date :',
                              style: theme.textTheme.titleLarge!.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            flex: 2,
                            child: InputDatePicker(
                              name: 'end_date',
                              hintText: '',
                              firstDate: DateTime.now(),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 13),
                      Text(
                        'Attachment :',
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: DottedBorder(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              Obx(
                                () => Visibility(
                                  visible: controller.attachmentPath.value == '',
                                  child: Text(
                                    'upload your letter according\nto the description\n(DOC/PDF/Image)',
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                  replacement: Text(
                                    controller.attachmentPath.value.split('/').last,
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  controller.chooseFile();
                                },
                                child: Container(
                                  height: 44,
                                  width: 208,
                                  decoration: BoxDecoration(
                                    color: Get.theme.primaryColor,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Obx(
                                      () => Text(
                                        controller.attachmentPath.value == '' ? 'Choose File' : 'Change File',
                                        style: theme.textTheme.titleLarge,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 9),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 33),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            controller.createAttendancePermit();
                          },
                          child: Container(
                            height: 44,
                            width: 208,
                            decoration: BoxDecoration(
                              color: Get.theme.primaryColor,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Save',
                                style: theme.textTheme.titleLarge!.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 13),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
