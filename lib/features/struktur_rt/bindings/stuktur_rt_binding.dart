import 'package:get/get.dart';

import '../controllers/stuktur_rt_controller.dart';

class StukturRTBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StukturRTController());
  }
}
