import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/admin_area/view/components/button_admin.dart';
import 'package:venturo_core/features/admin_area/view/components/top_bar_admin.dart';
import 'package:venturo_core/features/admin_informasi/view/ui/admin_informasi_screen.dart';
import 'package:venturo_core/features/admin_iuran/view/ui/admin_iuran_screen.dart';
import 'package:venturo_core/features/admin_pengumuman/view/ui/admin_pengumuman_screen.dart';
import 'package:venturo_core/features/data_blok/view/ui/data_blok_screen.dart';
import 'package:venturo_core/features/general/view/ui/general_screen.dart';
import 'package:venturo_core/features/hak_akses/view/ui/hak_akses_screen.dart';
import 'package:venturo_core/features/iuran_warga/constants/iuran_warga_assets_constant.dart';
import 'package:venturo_core/features/iuran_warga/view/components/button_iuran.dart';
import 'package:venturo_core/features/iuran_warga/view/components/top_bar_iuran_warga.dart';
import 'package:venturo_core/features/iuran_warga/view/ui/riwayat_pembayaran_screen.dart';
import 'package:venturo_core/features/konfirmasi_pembayaran/view/ui/konfirmasi_pembayaran_screen.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/ui/laporan_pembayaran_screen.dart';
import 'package:venturo_core/features/rekap_tahunan/view/ui/rekap_tahunan_screen.dart';
import 'package:venturo_core/features/uang_keluar/view/ui/uang_keluar_screen.dart';
import 'package:venturo_core/features/uang_masuk/view/ui/uang_masuk_screen.dart';
import 'package:venturo_core/features/undang_warga/view/ui/undang_warga_screen.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class AdminAreaScreen extends StatelessWidget {
  AdminAreaScreen({Key? key}) : super(key: key);

  final assetsConstant = IuranWargaAssetsConstant();

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil with the current BuildContext

    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Topbar
            const TopBarAdmin(),

            28.verticalSpace,

            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengaturan",
                    style: PoppinsTextStyle.fw600.copyWith(
                      fontSize: 21.sp,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  12.verticalSpace,
                  // List Button Iuran
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 18.w),
                    child: ButtonAdmin(
                      title: 'General',
                      onTap: () {
                        Get.to(const GeneralScreen());
                      },
                    ),
                  ),
                  13.verticalSpace,
                  //Pengumuman
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 18.w),
                    child: ButtonAdmin(
                      title: 'Pengumuman',
                      onTap: () {
                        Get.to(AdminPengumumanScreen());
                      },
                    ),
                  ),
                  13.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 18.w),
                    child: ButtonAdmin(
                      title: 'Informasi',
                      onTap: () {
                        Get.to(AdminInformasiScreen());
                      },
                    ),
                  ),
                  13.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 18.w),
                    child: ButtonAdmin(
                      title: 'Iuran Warga',
                      onTap: () {
                        Get.to(AdminIuranScreen());
                      },
                    ),
                  ),
                  13.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 18.w),
                    child: ButtonAdmin(
                      title: 'Hak Akses',
                      onTap: () {
                        Get.to(HakAksesScreen());
                      },
                    ),
                  ),
                  18.verticalSpace,
                  Text(
                    "Penghuni",
                    style: PoppinsTextStyle.fw600.copyWith(
                      fontSize: 21.sp,
                    ),
                    textAlign: TextAlign.left,
                  ),

                  12.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 18.w),
                    child: ButtonAdmin(
                      title: 'Undang Warga',
                      onTap: () {
                        Get.to(UndangWargaScreen());
                      },
                    ),
                  ),
                  13.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 18.w),
                    child: ButtonAdmin(
                      title: 'Blok dan No Rumah',
                      onTap: () {
                        Get.to(DataBlokScreen());
                      },
                    ),
                  ),
                  18.verticalSpace,

                  Text(
                    "Transaksi",
                    style: PoppinsTextStyle.fw600.copyWith(
                      fontSize: 21.sp,
                    ),
                    textAlign: TextAlign.left,
                  ),

                  12.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 18.w),
                    child: ButtonAdmin(
                      title: 'Konfirmasi Pembayaran',
                      onTap: () {
                        Get.to(KonfirmasiPembayaranScreen());
                      },
                    ),
                  ),
                  13.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 18.w),
                    child: ButtonAdmin(
                      title: 'Uang Masuk',
                      onTap: () {
                        Get.to(UangMasukScreen());
                      },
                    ),
                  ),
                  13.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 18.w),
                    child: ButtonAdmin(
                      title: 'Uang Keluar',
                      onTap: () {
                        Get.to(UangKeluarScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),

            33.verticalSpace,
          ],
        ),
      ),
    );
  }
}
