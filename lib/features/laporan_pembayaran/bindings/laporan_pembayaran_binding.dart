import 'package:get/get.dart';

import '../controllers/laporan_pembayaran_controller.dart';

class LaporanPembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LaporanPembayaranController());
  }
}
