// InformationController.dart
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminInformasiController extends GetxController {
  RxList<Information> informationList = <Information>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Call the method to load data from shared_preferences
    loadInformation();
  }

  void addInformation(Information information) {
    informationList.add(information);
    // Call the method to save data to shared_preferences
    saveInformation();
  }

  void removeInformation(int index) {
    informationList.removeAt(index);
    // Call the method to save data to shared_preferences
    saveInformation();
  }

  // Method to save data to shared_preferences
  void saveInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'informationList',
      informationList
          .map((information) =>
              '${information.title},${information.content},${information.imagePath}')
          .toList(),
    );
  }

  // Method to load data from shared_preferences
  void loadInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? informationStrings = prefs.getStringList('informationList');

    if (informationStrings != null) {
      informationList.value = informationStrings
          .map((informationString) {
            List<String> parts = informationString.split(',');
            return Information(
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
class Information {
  String title;
  String content;
  String imagePath; // Image path, can be given logic as needed
  final String? category;
  Information({
    required this.title,
    required this.content,
    required this.imagePath,
    this.category,
  });
}
