import 'package:dummy/controllers/locationController.dart';
import 'package:get/get.dart';

class locationBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => locationController());
  }
}
