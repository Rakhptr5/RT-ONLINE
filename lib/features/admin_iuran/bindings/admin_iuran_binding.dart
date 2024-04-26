import 'package:get/get.dart';
import 'package:venturo_core/features/admin_iuran/controllers/admin_iuran_controller.dart';

class AdminIuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminIuranController());
  }
}
