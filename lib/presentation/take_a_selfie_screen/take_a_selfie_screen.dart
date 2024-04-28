import 'controller/take_a_selfie_controller.dart';
import 'package:flutter/material.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/widgets/custom_elevated_button.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';

class TakeASelfieScreen extends StatelessWidget {
  TakeASelfieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 27.v),
                child: Column(children: [
                  SizedBox(height: 26.v),
                  _buildTakeASelfieSection(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                            width: 102.h,
                            margin: EdgeInsets.only(left: 43.h),
                            child: Text("msg_monday_at_08_00".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.titleLargeGray50)),
                      )),
                  SizedBox(height: 10.v),
                  _buildProfileSection(context)
                ])),
            bottomNavigationBar: _buildSaveSection()));
  }

  Widget _buildProfileSection(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkCameraPermission(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.data == true) {
          return GestureDetector(
            onTap: () => _openCamera(context),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 33),
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                color:
                    Colors.transparent, // Set background color to transparent
                borderRadius: BorderRadius.circular(8.0), // Add rounded corners
                border: Border.all(
                    color: Colors.black, width: 5), // Add thin black border
              ),
              width: 250,
              height: 250,
              child: FutureBuilder<void>(
                future: _initializeCamera(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      _controller != null) {
                    return CameraPreview(_controller!);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          );
        } else {
          return Text("Camera permission not granted");
        }
      },
    );
  }

  Widget _buildTakeASelfieSection() {
    return SizedBox(
        height: 74.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: 38.v,
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: appTheme.black900))),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text("lbl_take_a_selfie".tr,
                      style: theme.textTheme.headlineSmall))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 40.h, top: 45.v),
                  child: Text("lbl_come_to_work".tr,
                      style: CustomTextStyles.headlineSmallTajawal))),
        ]));
  }

  Widget _buildSaveSection() {
    return CustomElevatedButton(
        height: 53.v,
        width: 176.h,
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 92.h, right: 92.h, bottom: 55.v),
        buttonStyle: CustomButtonStyles.fillWhiteA,
        buttonTextStyle: CustomTextStyles.headlineSmallBlack900,
        onPressed: () {
          onTapSaveSection();
        });
  }

  /// Navigates to the homeUniqueCodeScreen when the action is triggered.
  onTapSaveSection() {
    Get.toNamed(
      AppRoutes.homeUniqueCodeScreen,
    );
  }

  late CameraController? _controller;

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );
    await _controller!.initialize();
  }

  Future<bool> _checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      status = await Permission.camera.request();
      if (status.isDenied) {
        return false;
      }
    }
    return true;
  }

  void _openCamera(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(controller: _controller!),
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  final CameraController controller;

  CameraScreen({Key? key, required this.controller}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Take a Selfie"),
      ),
      body: CameraPreview(widget.controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final image = await widget.controller.takePicture();
            // Use the captured image here
          } catch (e) {
            print("Error: $e");
          }
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
