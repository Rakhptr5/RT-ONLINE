import 'package:get/get.dart';

import '../controllers/rincian_iuran_controller.dart';

class RincianIuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RincianIuranController());
  }
}
