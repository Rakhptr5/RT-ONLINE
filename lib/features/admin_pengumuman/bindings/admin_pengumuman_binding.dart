import 'package:get/get.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';

class AdminPengumumanBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminPengumumanController());
  }
}
