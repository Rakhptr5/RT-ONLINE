// InformationController.dart
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UangKeluarController extends GetxController {
  RxList<UangKeluar> uangkeluarList = <UangKeluar>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Call the method to load data from shared_preferences
    loadUangkeluar();
  }

  void addUangkeluar(UangKeluar uangkeluar) {
    uangkeluarList.add(uangkeluar);
    // Call the method to save data to shared_preferences
    saveUangkeluar();
  }

  void removeUangkeluar(int index) {
    uangkeluarList.removeAt(index);
    // Call the method to save data to shared_preferences
    saveUangkeluar();
  }

  // Method to save data to shared_preferences
  void saveUangkeluar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'uangkeluarList',
      uangkeluarList
          .map((uangkeluar) =>
              '${uangkeluar.title},${uangkeluar.content},,${uangkeluar.nominal},${uangkeluar.qty},${uangkeluar.total},${uangkeluar.date},')
          .toList(),
    );
  }

  // Method to load data from shared_preferences
  void loadUangkeluar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? uangkeluarStrings = prefs.getStringList('uangkeluarList');

    if (uangkeluarStrings != null) {
      uangkeluarList.value = uangkeluarStrings
          .map((uangkeluarString) {
            List<String> parts = uangkeluarString.split(',');
            return UangKeluar(
              title: parts[0],
              content: parts[1],
              nominal: parts[2],
              qty: parts[3],
              total: parts[4],
              date: parts[5],
            );
          })
          .toList()
          .obs;
    }
  }
}

// Information.dart
class UangKeluar {
  String title;
  String content;
  String date;
  String nominal;
  String qty;
  String total;
  // Image path, can be given logic as needed
  final String? category;
  UangKeluar({
    required this.title,
    required this.content,
    required this.date,
    this.category,
    required this.nominal,
    required this.qty,
    required this.total,
  });
}
