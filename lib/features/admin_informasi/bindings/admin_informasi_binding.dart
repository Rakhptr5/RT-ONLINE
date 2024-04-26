import 'package:get/get.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_informasi_controller.dart';

class AdminInformasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminInformasiController());
  }
}
