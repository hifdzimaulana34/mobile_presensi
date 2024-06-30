import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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

  void initialFunction() async {
    isLoading.listen((v) {
      if (v) {
        dialogLoading();
      } else if (!v && Get.isDialogOpen!) {
        Get.back();
      }
    });
    await initializeCamera();
    await graintLocationAccess();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialFunction();
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

  Future<List<Placemark>?> getLocation() async {
    try {
      final location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      logKey('location', location.toJson());
      final address = getAddress(location.latitude, location.longitude);
      return address;
    } catch (e) {
      logKey('error getLocation', e);
      return null;
    }
  }

  Future<List<Placemark>?> getAddress(lat, long) async {
    try {
      final res = await placemarkFromCoordinates(lat, long);
      return res;
      logKey('res getAddress', res);
    } catch (e) {
      logKey('error getAddress', getAddress);
      return null;
    }
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

  Future<void> graintLocationAccess() async {
    final status = await Permission.location.status;
    logKey(status);
    if (!status.isGranted) {
      final newStatus = await Permission.location.request();
      logKey(newStatus);
      return;
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

  Future<Map<String, dynamic>?> faceVerification(String identifier, String imagePath) async {
    var formData = FormData.fromMap({
      'image': MultipartFile.fromFileSync(imagePath),
      // 'image': MultipartFile.fromBytes(await imageData.readAsBytes()),
      'identifier': identifier,
    });
    try {
      final Response res = await networkC.post(
        // 'http://identifika.ramadani.site/face_verification',
        'https://api.ramadani.site/face_verification',
        body: formData,
      );
      logKey('res faceVerification', res.data);
      return res.data;
    } on DioException catch (e) {
      logKey('error faceVerification', e.response?.data);
      logKey('error faceVerification', e.requestOptions.data);
      logKey('error faceVerification', e.requestOptions.headers);
      return null;
    } catch (e) {
      print('error $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> faceRecog(String imagePath) async {
    var formData = FormData.fromMap({
      // 'image': MultipartFile.fromFileSync(imagePath.value),
      'image': MultipartFile.fromFileSync(imagePath),
    });
    try {
      final Response res = await networkC.post(
        // 'http://identifika.ramadani.site/face_recognition',
        'https://api.ramadani.site/face_recognition',
        // 'http://34.67.246.232:3000/face_recognition',
        body: formData,
      );
      logKey('res faceRecog', res.data);
      return res.data;
    } on DioException catch (e) {
      logKey('error faceRecog', e.response?.data);
      logKey('error faceRecog', e.requestOptions.data);
      logKey('error faceRecog', e.requestOptions.headers);
      logKey('error faceRecog', e.message);
      return null;
    } catch (e) {
      print('error $e');
      return null;
    }
  }

  Future<void> testIdentifika() async {
    isLoading.value = true;
    final location = await getLocation();
    if (location == null) {
      isLoading.value = false;
      Get.defaultDialog(
        backgroundColor: Get.theme.primaryColor,
        middleText: 'Tidak bisa mendapatkan lokasi',
      );
      return;
    }
    final imageData = await getCameraImage();
    if (imageData == null) {
      isLoading.value = false;
      return null;
    }
    final res = await faceRecog(imageData.path);
    if (res == null || !res['result']['verified']) {
      isLoading.value = false;
      Get.defaultDialog(
        backgroundColor: Get.theme.primaryColor,
        middleText: 'Error face recog',
      );
      return;
    }
    final resVerif = await faceVerification(res['result']['user']['_id'], imageData.path);
    logKey('resVerif zxc', resVerif);
    isLoading.value = false;
    if (resVerif == null) {
      Get.defaultDialog(
        backgroundColor: Get.theme.primaryColor,
        middleText: 'Error face verification',
      );
      return;
    }
    if (!resVerif['result']['verified']) {
      Get.defaultDialog(
        backgroundColor: Get.theme.primaryColor,
        middleText: 'Error face verification - not verified',
      );
      return;
    }
    Get.defaultDialog(
      backgroundColor: Get.theme.primaryColor,
      title: 'Berhasil',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nama : ${res['result']['user']['user_name']}',
            style: theme.textTheme.headlineSmall,
          ),
          Text(
            'Alamat : ${location.first.street ?? ''}',
            style: theme.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
