import 'package:hifdzi_s_application3/core/app_export.dart';

import '../models/memasukkan_unique_code_model.dart';

/// A controller class for the MemasukkanUniqueCodeDialog.
///
/// This class manages the state of the MemasukkanUniqueCodeDialog, including the
/// current memasukkanUniqueCodeModelObj
class MemasukkanUniqueCodeController extends GetxController {
  Rx<MemasukkanUniqueCodeModel> memasukkanUniqueCodeModelObj = MemasukkanUniqueCodeModel().obs;
}
