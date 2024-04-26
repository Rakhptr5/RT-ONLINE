// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:venturo_core/features/data_warga/constants/data_warga_assets_constant.dart';
import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_card.dart';
import 'package:venturo_core/features/data_warga/view/components/header_data_warga.dart';
import 'package:venturo_core/features/data_warga/view/components/search_bar_data_warga.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/terbayar_belumterbayar.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/top_bar_preview_kas.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

import '../../../beranda/view/components/header_beranda.dart';
import '../../../beranda/view/components/top_bar_preview_kas.dart';
import '../../controllers/laporan_pembayaran_controller.dart';
import '../components/laporan_pembayaran_card.dart';

class LaporanPembayaranScreen extends StatelessWidget {
  LaporanPembayaranScreen({Key? key}) : super(key: key);

  final assetsConstant = DataWargaAssetsConstant();

  @override
  Widget build(BuildContext context) {
    // List A
    List<LaporanPembayaranCard> listDataWargaA = [];
    for (int i = 0; i < 10; i++) {
      listDataWargaA.add(
        const LaporanPembayaranCard(
          profileBadge: "A-20",
          profileImage: 'assets/images/Que.jpeg',
          profileName: "Ahmad Sujadi",
          profileNumber: 'Rp 300.000',
        ),
      );
    }

    // List B
    List<LaporanPembayaranCard> listDataWargaB = [];
    for (int i = 0; i < 20; i++) {
      listDataWargaB.add(
        const LaporanPembayaranCard(
          profileBadge: "A-20",
          profileImage: 'assets/images/Que.jpeg',
          profileName: "Ahmad Sujadi",
          profileNumber: 'Rp 300.000',
        ),
      );
    }

    // List C
    List<LaporanPembayaranCard> listDataWargaC = [];
    for (int i = 0; i < 12; i++) {
      listDataWargaC.add(
        const LaporanPembayaranCard(
          profileBadge: "A-20",
          profileImage: 'assets/images/Que.jpeg',
          profileName: "Ahmad Sujadi",
          profileNumber: 'Rp 300.000',
        ),
      );
    }

    // List D
    List<LaporanPembayaranCard> listDataWargaD = [];
    for (int i = 0; i < 5; i++) {
      listDataWargaD.add(
        const LaporanPembayaranCard(
          profileBadge: "A-20",
          profileImage: 'assets/images/Que.jpeg',
          profileName: "Ahmad Sujadi",
          profileNumber: 'Rp 300.000',
        ),
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
                Container(
                  height: 135.w,
                ),
                const HeaderBeranda(
                  text: "Pembayaran Warga",
                  prefixIcon: Icons.arrow_back_ios_new_rounded,
                ),

                130.verticalSpace,

                // Button
                const Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,

                    // Button Container
                    child: TopBarPreviewKas(
                      text: "Oktober",
                    ),
                  ),
                )
              ],
            ),

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
                    ListView.builder(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                      itemCount: listDataWargaA.length,
                      itemBuilder: (context, index) {
                        return LaporanPembayaranCard(
                          profileImage: listDataWargaA[index].profileImage,
                          profileName: listDataWargaA[index].profileName,
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
                        return LaporanPembayaranCard(
                          profileImage: listDataWargaB[index].profileImage,
                          profileName: listDataWargaB[index].profileName,
                          profileNumber: listDataWargaB[index].profileNumber,
                          profileBadge: listDataWargaB[index].profileBadge,
                        );
                      },
                    ),

                    // Blok C
                    ListView.builder(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                      itemCount: listDataWargaC.length,
                      itemBuilder: (context, index) {
                        return LaporanPembayaranCard(
                          profileImage: listDataWargaC[index].profileImage,
                          profileName: listDataWargaC[index].profileName,
                          profileNumber: listDataWargaC[index].profileNumber,
                          profileBadge: listDataWargaC[index].profileBadge,
                        );
                      },
                    ),

                    // Blok D
                    ListView.builder(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                      itemCount: listDataWargaD.length,
                      itemBuilder: (context, index) {
                        return LaporanPembayaranCard(
                          profileImage: listDataWargaD[index].profileImage,
                          profileName: listDataWargaD[index].profileName,
                          profileNumber: listDataWargaD[index].profileNumber,
                          profileBadge: listDataWargaD[index].profileBadge,
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
