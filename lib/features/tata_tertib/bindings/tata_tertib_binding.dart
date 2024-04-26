import 'package:get/get.dart';

import '../controllers/tata_tertib_controller.dart';

class TataTertibBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TataTertibController());
  }
}
