// InformationController.dart
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UangMasukController extends GetxController {
  RxList<UangMasuk> uangmasukList = <UangMasuk>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Call the method to load data from shared_preferences
    loadUangmasuk();
  }

  void addUangmasuk(UangMasuk uangmasuk) {
    uangmasukList.add(uangmasuk);
    // Call the method to save data to shared_preferences
    saveUangmasuk();
  }

  void removeUangmasuk(int index) {
    uangmasukList.removeAt(index);
    // Call the method to save data to shared_preferences
    saveUangmasuk();
  }

  // Method to save data to shared_preferences
  void saveUangmasuk() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'uangmasukList',
      uangmasukList
          .map((uangmasuk) =>
              '${uangmasuk.title},${uangmasuk.content},,${uangmasuk.nominal},')
          .toList(),
    );
  }

  // Method to load data from shared_preferences
  void loadUangmasuk() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? uangmasukStrings = prefs.getStringList('uangmasukList');

    if (uangmasukStrings != null) {
      uangmasukList.value = uangmasukStrings
          .map((uangmasukString) {
            List<String> parts = uangmasukString.split(',');
            return UangMasuk(
              title: parts[0],
              content: parts[1],
              nominal: parts[2],
            );
          })
          .toList()
          .obs;
    }
  }
}

// Information.dart
class UangMasuk {
  String title;
  String content;
  String nominal;
  // Image path, can be given logic as needed
  final String? category;
  UangMasuk({
    required this.title,
    required this.content,
    this.category,
    required this.nominal,
  });
}
