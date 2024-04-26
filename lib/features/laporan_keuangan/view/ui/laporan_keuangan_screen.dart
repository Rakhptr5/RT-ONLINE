// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:venturo_core/features/data_warga/constants/data_warga_assets_constant.dart';
import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_card.dart';
import 'package:venturo_core/features/data_warga/view/components/header_data_warga.dart';
import 'package:venturo_core/features/data_warga/view/components/search_bar_data_warga.dart';
import 'package:venturo_core/features/laporan_keuangan/controllers/laporan_keuangan_controller.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/container_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/laporan_keuangan_card.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/laporan_keuangan_card2.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/top_bar_keuangan.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/terbayar_belumterbayar.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/top_bar_preview_kas.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

import '../../../beranda/view/components/header_beranda.dart';
import '../../../beranda/view/components/top_bar_preview_kas.dart';

class LaporanKeuanganScreen extends StatelessWidget {
  LaporanKeuanganScreen({Key? key}) : super(key: key);

  final assetsConstant = DataWargaAssetsConstant();

  @override
  Widget build(BuildContext context) {
    // List A
    List<LaporanKeuanganCard> listDataWargaA = [];
    for (int i = 0; i < 5; i++) {
      listDataWargaA.add(
        const LaporanKeuanganCard(
          profileBadge: "A-20",
          profileImage: 'assets/images/Que.jpeg',
          profileIuran: "Iuran Bulanan",
          profileName: "Ahmad Sujadi",
          profileNumber: 'Senin, 30 Okt 2023 08:00',
        ),
      );
    }

    // List B
    List<LaporanKeuanganCard2> listDataWargaB = [];
    for (int i = 0; i < 9; i++) {
      listDataWargaB.add(
        const LaporanKeuanganCard2(
          profileName: "Mushola",
          profileNumber: 'Senin, 30 Okt 2023 08:00',
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffeff0f5),
        body: Column(
          children: [
            // Stack
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 135.w,
                ),
                const HeaderBeranda(
                  text: "Laporan Keuangan",
                  prefixIcon: Icons.arrow_back_ios_new_rounded,
                ),

                170.verticalSpace,

                // Button

                // Button Container
                Padding(
                  padding: const EdgeInsets.only(top: 120.0, left: 20),
                  child: TopBarLaporanKeuangan(
                    text: "Oktober",
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            ContainerKeuangan(),
            5.verticalSpace,
            SizedBox(
              width: 382.w,
              child: Obx(
                () => TabBar(
                  dividerColor: Colors.grey,
                  indicatorWeight: 2.w,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: const Color(0xFF6454F0),
                  onTap: (x) {
                    LaporanKeuanganController.to.currentIndex.value = x;
                  },
                  tabs: <Widget>[
                    Tab(
                      child: buildTab(text: "Pemasukan", index: 0),
                    ),
                    Tab(
                      child: buildTab(text: "Pengeluaran", index: 1),
                    ),
                  ],
                ),
              ),
            ),

            20.verticalSpace,
            Expanded(
              child: SizedBox(
                child: TabBarView(
                  children: <Widget>[
                    // Blok A
                    ListView.builder(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                      itemCount: listDataWargaA.length,
                      itemBuilder: (context, index) {
                        return LaporanKeuanganCard(
                          profileImage: listDataWargaA[index].profileImage,
                          profileName: listDataWargaA[index].profileName,
                          profileIuran: listDataWargaA[index].profileIuran,
                          profileNumber: listDataWargaA[index].profileNumber,
                          profileBadge: listDataWargaA[index].profileBadge,
                        );
                      },
                    ),

                    // Blok B
                    ListView.builder(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                      itemCount: listDataWargaB.length,
                      itemBuilder: (context, index) {
                        return LaporanKeuanganCard2(
                          profileName: listDataWargaB[index].profileName,
                          profileNumber: listDataWargaB[index].profileNumber,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTab({
    required String text,
    required int index,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: NunitoTextStyle.fw700.copyWith(
            color: (LaporanKeuanganController.to.currentIndex.value == index)
                ? const Color(0xFF6454F0)
                : Colors.grey,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
