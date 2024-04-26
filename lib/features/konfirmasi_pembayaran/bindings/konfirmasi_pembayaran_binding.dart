import 'package:get/get.dart';
import 'package:venturo_core/features/konfirmasi_pembayaran/controllers/konfirmasi_pembayaran_controller.dart';

class KonfirmasiPembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(KonfirmasiPembayaranController());
  }
}
