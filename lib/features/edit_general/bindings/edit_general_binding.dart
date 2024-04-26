import 'package:get/get.dart';
import 'package:venturo_core/features/edit_general/controllers/edit_general_controller.dart';

class EditGeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditGeneralController());
  }
}
