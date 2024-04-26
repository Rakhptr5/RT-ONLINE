// KategoriController.dart
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KategoriIuranController extends GetxController {
  RxList<Kategori> kategoris = <Kategori>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Panggil method untuk memuat data dari shared_preferences
    loadKategoris();
  }

  void addKategori(Kategori kategori) {
    kategoris.add(kategori);
    // Panggil method untuk menyimpan data ke shared_preferences
    saveKategoris();
  }

  void removeKategori(int index) {
    kategoris.removeAt(index);
    // Panggil method untuk menyimpan data ke shared_preferences
    saveKategoris();
  }

  // Method untuk menyimpan data ke shared_preferences
  void saveKategoris() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'kategoris',
      kategoris
          .map((kategori) =>
              '${kategori.title},${kategori.content},${kategori.imagePath}')
          .toList(),
    );
  }

  // Method untuk memuat data dari shared_preferences
  void loadKategoris() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? kategoriStrings = prefs.getStringList('kategoris');

    if (kategoriStrings != null) {
      kategoris.value = kategoriStrings
          .map((kategoriString) {
            List<String> parts = kategoriString.split(',');
            return Kategori(
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

// Kategori.dart
class Kategori {
  String title;
  String content;
  String imagePath; // Path gambar, nanti bisa diberi logic sesuai kebutuhan

  Kategori(
      {required this.title, required this.content, required this.imagePath});
}
