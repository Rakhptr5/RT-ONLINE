import 'package:get/get.dart';

class LaporanKeuanganController extends GetxController {
  static LaporanKeuanganController get to =>
      Get.put(LaporanKeuanganController());

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
