import 'package:flutter_instagram/src/controller/upload_controller.dart';
import 'package:get/get.dart';

class UploadBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UploadController());
  }
}
