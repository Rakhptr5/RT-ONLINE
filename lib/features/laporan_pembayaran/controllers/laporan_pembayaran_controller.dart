import 'package:get/get.dart';

class LaporanPembayaranController extends GetxController {
  static LaporanPembayaranController get to =>
      Get.put(LaporanPembayaranController());

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
