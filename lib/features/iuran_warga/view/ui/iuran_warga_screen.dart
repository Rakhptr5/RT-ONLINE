import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/iuran_warga/constants/iuran_warga_assets_constant.dart';
import 'package:venturo_core/features/iuran_warga/view/components/button_iuran.dart';
import 'package:venturo_core/features/iuran_warga/view/components/top_bar_iuran_warga.dart';
import 'package:venturo_core/features/iuran_warga/view/ui/riwayat_pembayaran_screen.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/ui/laporan_pembayaran_screen.dart';
import 'package:venturo_core/features/rekap_tahunan/view/ui/rekap_tahunan_screen.dart';

class IuranWargaScreen extends StatelessWidget {
  IuranWargaScreen({Key? key}) : super(key: key);

  final assetsConstant = IuranWargaAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Topbar
          const TopBarIuranWarga(),

          32.verticalSpace,

          // List Button Iuran
          ButtonIuran(
            title: 'Rekap Pembayaran',
            onTap: () {
              Get.to(const RiwayatPembayaranScreen());
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.w),
            child: ButtonIuran(
              title: 'Rekap Tahunan Warga',
              onTap: () {
                Get.to(RekapTahunanScreen());
              },
            ),
          ),
          ButtonIuran(
            title: 'Rekap Bulanan Warga',
            onTap: () {
              Get.to(LaporanPembayaranScreen());
            },
          ),
        ],
      ),
    );
  }
}
