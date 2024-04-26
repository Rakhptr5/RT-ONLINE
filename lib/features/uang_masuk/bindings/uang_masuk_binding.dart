import 'package:get/get.dart';
import 'package:venturo_core/features/uang_masuk/controllers/uang_masuk_controller.dart';

class UangMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UangMasukController());
  }
}
