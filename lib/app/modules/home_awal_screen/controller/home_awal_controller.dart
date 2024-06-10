import 'package:hifdzi_s_application3/core/app_export.dart';

import '../models/home_awal_model.dart';

/// A controller class for the HomeAwalScreen.
///
/// This class manages the state of the HomeAwalScreen, including the
/// current homeAwalModelObj
class HomeAwalController extends GetxController {
  Rx<HomeAwalModel> homeAwalModelObj = HomeAwalModel().obs;
}
