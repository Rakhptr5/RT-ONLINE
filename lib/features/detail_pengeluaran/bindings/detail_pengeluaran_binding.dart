import 'package:get/get.dart';
import 'package:venturo_core/features/detail_pengeluaran/controllers/detail_pengeluaran_controller.dart';

class DetailPengeluaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailPengeluaranController());
  }
}
