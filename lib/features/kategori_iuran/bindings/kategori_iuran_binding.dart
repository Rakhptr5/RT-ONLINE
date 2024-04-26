import 'package:get/get.dart';
import 'package:venturo_core/features/kategori_iuran/controllers/kategori_iuran_controller.dart';

class KategoriIuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(KategoriIuranController());
  }
}
