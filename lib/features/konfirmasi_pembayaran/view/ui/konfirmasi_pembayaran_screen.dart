// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:venturo_core/features/data_warga/constants/data_warga_assets_constant.dart';
import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_card.dart';
import 'package:venturo_core/features/data_warga/view/components/header_data_warga.dart';
import 'package:venturo_core/features/data_warga/view/components/search_bar_data_warga.dart';
import 'package:venturo_core/features/edit_general/view/components/top_bar_edit_general.dart';
import 'package:venturo_core/features/konfirmasi_pembayaran/view/components/laporan_pembayaran_card.dart';
import 'package:venturo_core/features/laporan_pembayaran/controllers/laporan_pembayaran_controller.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/terbayar_belumterbayar.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/top_bar_preview_kas.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

import '../../../beranda/view/components/header_beranda.dart';
import '../../../beranda/view/components/top_bar_preview_kas.dart';

class KonfirmasiPembayaranScreen extends StatelessWidget {
  KonfirmasiPembayaranScreen({Key? key}) : super(key: key);

  final assetsConstant = DataWargaAssetsConstant();

  @override
  Widget build(BuildContext context) {
    // List A
    List<KonfirmasiPembayaranCard> listDataWargaA = [];
    for (int i = 0; i < 10; i++) {
      listDataWargaA.add(
        KonfirmasiPembayaranCard(),
      );
    }

    // List B
    List<KonfirmasiPembayaranCard> listDataWargaB = [];
    for (int i = 0; i < 20; i++) {
      listDataWargaB.add(KonfirmasiPembayaranCard());
    }

    // List C
    List<KonfirmasiPembayaranCard> listDataWargaC = [];
    for (int i = 0; i < 12; i++) {
      listDataWargaC.add(KonfirmasiPembayaranCard());
    }

    // List D
    List<KonfirmasiPembayaranCard> listDataWargaD = [];
    for (int i = 0; i < 5; i++) {
      listDataWargaD.add(
        KonfirmasiPembayaranCard(),
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xffeff0f5),
        body: Column(
          children: [
            // Stack
            Stack(
              alignment: Alignment.topCenter,
              children: [
                const TopBarEditGeneral(
                  title: "Konfirmasi Pembayaran",
                ),

                // Button
              ],
            ),
            14.verticalSpace,
            SizedBox(
              width: 382.w,
              child: Obx(
                () => TabBar(
                  dividerColor: Colors.grey,
                  indicatorWeight: 2.w,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: const Color(0xFF6454F0),
                  onTap: (x) {
                    LaporanPembayaranController.to.currentIndex.value = x;
                  },
                  tabs: <Widget>[
                    Tab(
                      child: buildTab(text: "Blok A", index: 0),
                    ),
                    Tab(
                      child: buildTab(text: "Blok B", index: 1),
                    ),
                    Tab(
                      child: buildTab(text: "Blok C", index: 2),
                    ),
                    Tab(
                      child: buildTab(text: "Blok D", index: 3),
                    ),
                  ],
                ),
              ),
            ),

            20.verticalSpace,
            ContainerRow(),
            20.verticalSpace,
            Expanded(
              child: SizedBox(
                child: TabBarView(
                  children: <Widget>[
                    // Blok A
                    ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemCount: listDataWargaA.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10), // Jarak antara item
                      itemBuilder: (context, index) {
                        return KonfirmasiPembayaranCard();
                      },
                    ),

// Blok B
                    ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemCount: listDataWargaB.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10), // Jarak antara item
                      itemBuilder: (context, index) {
                        return KonfirmasiPembayaranCard();
                      },
                    ),

// Blok C
                    ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemCount: listDataWargaC.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10), // Jarak antara item
                      itemBuilder: (context, index) {
                        return KonfirmasiPembayaranCard();
                      },
                    ),

// Blok D
                    ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemCount: listDataWargaD.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10), // Jarak antara item
                      itemBuilder: (context, index) {
                        return KonfirmasiPembayaranCard();
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
            color: (LaporanPembayaranController.to.currentIndex.value == index)
                ? const Color(0xFF6454F0)
                : Colors.grey,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
