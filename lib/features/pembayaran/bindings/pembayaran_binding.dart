import 'package:get/get.dart';

import '../controllers/pembayaran_controller.dart';

class PembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PembayaranController());
  }
}
