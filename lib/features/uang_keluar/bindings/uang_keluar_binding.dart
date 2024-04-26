import 'package:get/get.dart';
import 'package:venturo_core/features/uang_keluar/controllers/uang_keluar_controller.dart';

class UangKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UangKeluarController());
  }
}
