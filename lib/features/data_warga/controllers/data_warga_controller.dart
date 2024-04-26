import 'package:get/get.dart';

class DataWargaController extends GetxController {
  static DataWargaController get to => Get.put(DataWargaController());

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
