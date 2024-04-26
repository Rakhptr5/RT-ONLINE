// HakAksesController.dart
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venturo_core/features/hak_akses/repositories/hak_akses_repository.dart';

class HakAkses {
  String title;

  String imagePath; // Path gambar, nanti bisa diberi logic sesuai kebutuhan

  HakAkses({required this.title, required this.imagePath});
}

class HakAksesController extends GetxController {
  Future<void> deleteHakAkses(String id) async {
    try {
      await HakAksesRepository.deleteHakAkses(id);
      // Panggil fungsi getHakAkses lagi setelah menghapus untuk memperbarui daftar
      getHak();
    } catch (e) {
      // Tangani kesalahan jika ada
      print("Error deleting Hak Akses: $e");
      // Tampilkan pesan kesalahan kepada pengguna jika perlu
      Get.snackbar("Error", "Failed to delete Hak Akses");
    }
  }

  static HakAksesController get to => Get.put(HakAksesController());
  RxList<HakAkses> hakAksesList = <HakAkses>[].obs;
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    // Panggil method untuk memuat data dari shared_preferences
    loadHakAkses();
  }

  void addHakAkses(HakAkses hakAkses) {
    hakAksesList.add(hakAkses);
    // Panggil method untuk menyimpan data ke shared_preferences
    saveHakAkses();
  }

  void removeHakAkses(int index) {
    hakAksesList.removeAt(index);
    // Panggil method untuk menyimpan data ke shared_preferences
    saveHakAkses();
  }

  // Method untuk menyimpan data ke shared_preferences
  void saveHakAkses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'hakAksesList',
      hakAksesList
          .map((hakAkses) => '${hakAkses.title},${hakAkses.imagePath}')
          .toList(),
    );
  }

  // Method untuk memuat data dari shared_preferences
  void loadHakAkses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? hakAksesStrings = prefs.getStringList('hakAksesList');

    if (hakAksesStrings != null) {
      hakAksesList.value = hakAksesStrings
          .map((hakAksesString) {
            List<String> parts = hakAksesString.split(',');
            return HakAkses(
              title: parts[0],
              imagePath: parts[1],
            );
          })
          .toList()
          .obs;
    }
  }
}
