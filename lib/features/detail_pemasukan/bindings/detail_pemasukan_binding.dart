import 'package:get/get.dart';
import 'package:venturo_core/features/detail_pemasukan/controllers/detail_pemasukan_controller.dart';

class DetailPemasukanBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailPemasukanController());
  }
}
