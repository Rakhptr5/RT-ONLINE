// InformationController.dart
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBlokController extends GetxController {
  RxList<Blok> datablokList = <Blok>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Call the method to load data from shared_preferences
    loadDatablok();
  }

  void addDatablok(Blok datablok) {
    datablokList.add(datablok);
    // Call the method to save data to shared_preferences
    saveDatablok();
  }

  void removeDatablok(int index) {
    datablokList.removeAt(index);
    // Call the method to save data to shared_preferences
    saveDatablok();
  }

  // Method to save data to shared_preferences
  void saveDatablok() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'datablokList',
      datablokList
          .map((datablok) =>
              '${datablok.title},${datablok.content},${datablok.imagePath}')
          .toList(),
    );
  }

  // Method to load data from shared_preferences
  void loadDatablok() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? datablokStrings = prefs.getStringList('datablokList');

    if (datablokStrings != null) {
      datablokList.value = datablokStrings
          .map((datablokString) {
            List<String> parts = datablokString.split(',');
            return Blok(
              title: parts[0],
              content: parts[1],
              imagePath: parts[2],
            );
          })
          .toList()
          .obs;
    }
  }
}

// Information.dart
class Blok {
  String title;
  String content;
  final String? blok;
  String imagePath; // Image path, can be given logic as needed
  final String? category;
  Blok({
    required this.title,
    required this.content,
    required this.imagePath,
    this.category,
    this.blok,
  });
}
