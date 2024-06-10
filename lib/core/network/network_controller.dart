import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class NetworkController extends GetxController {
  final Dio _dio = Dio();

  Future<({bool isConnected, ConnectivityResult res})> checkConnection() async {
    _dio.options.connectTimeout = const Duration(milliseconds: 5000);
    final res = await Connectivity().checkConnectivity();
    if (res == ConnectivityResult.none) {
      return (isConnected: false, res: ConnectivityResult.none);
    }
    return (isConnected: true, res: res);
  }

  Future<dynamic> get(String path) async {
    bool isConnect = false;
    final res = await checkConnection();
    isConnect = res.isConnected;
    if (!isConnect) {
      return;
    }

    try {
      Response res = await _dio.get(path);
      return res;
    } on DioException {
      rethrow;
    }
  }

  Future<dynamic> post(String path) async {
    bool isConnect = false;
    final res = await checkConnection();
    isConnect = res.isConnected;
    if (!isConnect) {
      return;
    }

    try {
      Response res = await _dio.post(path);
      return res;
    } on DioException {
      rethrow;
    }
  }
}
