import 'package:get/get.dart';
import 'package:venturo_core/features/admin_beranda/controllers/admin_beranda_controller.dart';

class AdminBerandaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminBerandaController());
  }
}
