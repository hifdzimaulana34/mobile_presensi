import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:hifdzi_s_application3/core/utils/function_utils.dart';

import '../utils/environtment.dart';

class NetworkController extends GetxController {
  final baseOptions = BaseOptions(
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds: 30),
  );
  late Dio _dio;
  final box = GetStorage();

  Future<void> saveToken(String token) async {
    await box.write('token', token);
    logKey('token saved $token');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _dio = Dio(baseOptions);
  }

  Future<({bool isConnected, ConnectivityResult res})> checkConnection() async {
    _dio.options.connectTimeout = const Duration(milliseconds: 5000);
    final res = await Connectivity().checkConnectivity();
    if (res == ConnectivityResult.none) {
      return (isConnected: false, res: ConnectivityResult.none);
    }
    return (isConnected: true, res: res);
  }

  Future<dynamic> get(
    String path, {
    bool isIdentifika = false,
    bool useAuth = false,
  }) async {
    bool isConnect = false;
    final res = await checkConnection();
    isConnect = res.isConnected;
    if (!isConnect) {
      return;
    }

    try {
      Response res = await _dio.get(
        path,
        options: Options(
          headers: {
            if (useAuth && !isIdentifika) 'Authorization': 'Bearer ${box.read('token')}',
          },
          sendTimeout: Duration(minutes: 1),
          receiveTimeout: Duration(minutes: 1),
        ),
      );
      return res;
    } on DioException {
      rethrow;
    }
  }

  Future<dynamic> post(
    String path, {
    Object? body,
    Map<String, dynamic>? param,
    bool isIdentifika = false,
    bool useAuth = false,
  }) async {
    bool isConnect = false;
    final res = await checkConnection();
    isConnect = res.isConnected;
    if (!isConnect) {
      return;
    }

    try {
      Response res = await _dio.post(
        path,
        data: body,
        queryParameters: param,
        options: Options(
          // contentType: 'application/json',
          contentType: isIdentifika ? 'multipart/form-data' : 'application/json',
          headers: {
            if (isIdentifika) 'e-face-api-key': '$tokenIdentifika',
            if (useAuth && !isIdentifika) 'Authorization': 'Bearer ${box.read('token')}',
          },
          sendTimeout: Duration(minutes: 1),
          receiveTimeout: Duration(minutes: 1),
        ),
      );
      return res;
    } on DioException {
      rethrow;
    }
  }
}
