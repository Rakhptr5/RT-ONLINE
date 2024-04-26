import 'package:get/get.dart';

import '../controllers/rekap_tahunan_controller.dart';

class RekapTahunanBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RekapTahunanController());
  }
}
