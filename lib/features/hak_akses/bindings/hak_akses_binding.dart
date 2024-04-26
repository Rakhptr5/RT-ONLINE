import 'package:get/get.dart';
import 'package:venturo_core/features/hak_akses/controllers/hak_akses_controller.dart';

class HakAksesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HakAksesController());
  }
}
