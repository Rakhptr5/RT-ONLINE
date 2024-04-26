import 'package:get/get.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';

class DataBlokBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataBlokController());
  }
}
