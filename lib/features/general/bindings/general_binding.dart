import 'package:get/get.dart';
import 'package:venturo_core/features/general/controllers/general_controller.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GeneralController());
  }
}
