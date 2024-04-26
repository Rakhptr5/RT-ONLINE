// AnnouncementController.dart
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPengumumanController extends GetxController {
  RxList<Announcement> announcements = <Announcement>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Panggil method untuk memuat data dari shared_preferences
    loadAnnouncements();
  }

  void addAnnouncement(Announcement announcement) {
    announcements.add(announcement);
    // Panggil method untuk menyimpan data ke shared_preferences
    saveAnnouncements();
  }

  void removeAnnouncement(int index) {
    announcements.removeAt(index);
    // Panggil method untuk menyimpan data ke shared_preferences
    saveAnnouncements();
  }

  // Method untuk menyimpan data ke shared_preferences
  void saveAnnouncements() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'announcements',
      announcements
          .map((announcement) =>
              '${announcement.title},${announcement.content},${announcement.imagePath}')
          .toList(),
    );
  }

  // Method untuk memuat data dari shared_preferences
  void loadAnnouncements() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? announcementStrings = prefs.getStringList('announcements');

    if (announcementStrings != null) {
      announcements.value = announcementStrings
          .map((announcementString) {
            List<String> parts = announcementString.split(',');
            return Announcement(
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

// Announcement.dart
class Announcement {
  String title;
  String content;
  String imagePath; // Path gambar, nanti bisa diberi logic sesuai kebutuhan

  Announcement(
      {required this.title, required this.content, required this.imagePath});
}
