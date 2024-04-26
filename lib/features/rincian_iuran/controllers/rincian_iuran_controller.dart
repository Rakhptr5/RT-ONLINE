import 'package:get/get.dart';

class RincianIuranController extends GetxController {
  static RincianIuranController get to => Get.put(RincianIuranController());

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
