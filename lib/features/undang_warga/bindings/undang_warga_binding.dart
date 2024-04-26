import 'package:get/get.dart';
import 'package:venturo_core/features/undang_warga/controllers/undang_warga_controller.dart';

class UndangWargaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UndangWargaController());
  }
}
