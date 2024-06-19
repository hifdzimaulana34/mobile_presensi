import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:hifdzi_s_application3/core/app_export.dart';
import 'package:hifdzi_s_application3/core/network/network_controller.dart';
import 'package:hifdzi_s_application3/core/utils/function_utils.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../routes/app_pages.dart';
import '../models/take_a_selfie_model.dart';
import '../take_a_selfie_screen.dart';

/// A controller class for the TakeASelfieScreen.
///
/// This class manages the state of the TakeASelfieScreen, including the
/// current takeASelfieModelObj
class TakeASelfieController extends GetxController {
  Rx<TakeASelfieModel> takeASelfieModelObj = TakeASelfieModel().obs;
  final networkC = Get.find<NetworkController>();
  late CameraController? cameraController;
  final isLoading = false.obs;

  var imagePath = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.listen((v) {
      if (v) {
        dialogLoading();
      } else if (!v && Get.isDialogOpen!) {
        Get.back();
      }
    });
    initializeCamera();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    cameraController!.dispose();
  }

  /// Navigates to the homeUniqueCodeScreen when the action is triggered.
  Future<void> onTapSaveSection() async {
    if (cameraController != null && cameraController!.value.isInitialized) {
      try {
        final XFile imageXFile = await cameraController!.takePicture();
        var temp = File(imageXFile.path);
        var path = temp.path;
        var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
        final String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
        var newPath = path.substring(0, lastSeparator + 1) + fileName;
        temp = await temp.rename(newPath);

        // imageXFile.saveTo(imageXFile.path);
        // final File imageFile = File(imageXFile.path);
        // final dir = path.dirname(imageXFile.path);
        // final newName = path.join(dir,'${DateTime.now().millisecondsSinceEpoch}.jpg');
        // await imageFile.rename(newName);

        // final String directoryPath = 'lib/images';
        // var directoryPath = await getApplicationDocumentsDirectory();

        // Directory imagesDirectory = Directory(directoryPath.path);
        // if (!imagesDirectory.existsSync()) {
        //   imagesDirectory.createSync(recursive: true);
        // }

        final res = await GallerySaver.saveImage(temp.path);
        // final String imagePath = '${directoryPath.path}/$fileName';

        // final File savedImage = File(imagePath);
        // await savedImage.writeAsBytes(await imageFile.readAsBytes());

        // print('Image saved successfully at: $imagePath');
        logKey('success', 'iamge saved at $res');

        // Get.toNamed(AppRoutes.homeUniqueCodeScreen);
        Get.toNamed(Routes.HOME_UNIQUE_CODE_SCREEN);
      } catch (e) {
        logKey('Error taking picture: $e');
      }
    } else {
      // Camera controller is not initialized or not in the correct state
      // Handle this case appropriately, e.g., show an error message
    }
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final frontCam = cameras[1];
    cameraController = CameraController(
      frontCam,
      ResolutionPreset.medium,
    );
    await cameraController!.initialize();
    update();
  }

  Future<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      status = await Permission.camera.request();
      if (status.isDenied) {
        return false;
      }
    }
    return true;
  }

  void openCamera(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(controller: cameraController!),
      ),
    );
  }

  void selectImage() async {
    final img = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (img != null) {
      imagePath.value = img.path;
    }
  }

  Future<XFile?> getCameraImage() async {
    if (cameraController == null) {
      return null;
    }
    final imageXfile = await cameraController!.takePicture();
    return imageXfile;
  }

  void faceRegistration() async {
    final byteImages = await File(imagePath.value).readAsBytes();
    final myFile = http.MultipartFile.fromBytes(
      'photo',
      byteImages,
      filename: imagePath.value,
      contentType: MediaType(
        'image',
        imagePath.value.split('.').last,
      ),
    );

    print(myFile.contentType);

    var formData = FormData.fromMap({
      'image': MultipartFile.fromFileSync(imagePath.value),
      'identifier': '',
      'real_name': 'Hifdzi',
      'client_id': '',
    });
    try {
      final Response res = await networkC.post(
        'http://identifika.ramadani.site/face_registration',
        // body: FormData.fromMap(data),
        body: formData,
      );
      logKey('res faceRegistration', res.data);
    } on DioException catch (e) {
      logKey('error faceRegistration', e.response?.data);
      logKey('error faceRegistration', e.requestOptions.data);
      logKey('error faceRegistration', e.requestOptions.headers);
      // logKey('error faceRegistration data', e.requestOptions.data);
      // logKey('error faceRegistration', e.error);
    } catch (e) {
      print('error $e');
    }
  }

  Future<void> faceVerification(String identifier, String imagePath) async {
    var formData = FormData.fromMap({
      'image': MultipartFile.fromFileSync(imagePath),
      // 'image': MultipartFile.fromBytes(await imageData.readAsBytes()),
      'identifier': identifier,
    });
    try {
      final Response res = await networkC.post(
        'http://identifika.ramadani.site/face_verification',
        body: formData,
      );
      logKey('res faceVerification', res.data);
    } on DioException catch (e) {
      logKey('error faceVerification', e.response?.data);
      logKey('error faceVerification', e.requestOptions.data);
      logKey('error faceVerification', e.requestOptions.headers);
    } catch (e) {
      print('error $e');
    }
  }

  Future<Map<String, dynamic>?> faceRecog(String imagePath) async {
    var formData = FormData.fromMap({
      // 'image': MultipartFile.fromFileSync(imagePath.value),
      'image': MultipartFile.fromFileSync(imagePath),
    });
    try {
      final Response res = await networkC.post(
        'http://identifika.ramadani.site/face_recognition',
        body: formData,
      );
      logKey('res faceVerification', res.data);
      return res.data;
    } on DioException catch (e) {
      logKey('error faceRecog', e.response?.data);
      logKey('error faceRecog', e.requestOptions.data);
      logKey('error faceRecog', e.requestOptions.headers);
      return null;
    } catch (e) {
      print('error $e');
      return null;
    }
  }

  Future<void> testIdentifika() async {
    isLoading.value = true;
    final imageData = await getCameraImage();
    if (imageData == null) {
      return null;
    }
    final res = await faceRecog(imageData.path);
    if (res == null || !res['result']['verified']) {
      isLoading.value = false;
      return;
    }
    await faceVerification(res['result']['user']['_id'], imageData.path);
    isLoading.value = false;
  }
}
