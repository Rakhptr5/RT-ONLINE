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
import 'package:venturo_core/features/rekap_tahunan/view/components/empty_pembayaran.dart';
import 'package:venturo_core/features/rekap_tahunan/view/components/header_rekap.dart';
import 'package:venturo_core/features/rekap_tahunan/view/components/top_bar_rekap_tahunan.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

import '../../../beranda/view/components/header_beranda.dart';
import '../../../beranda/view/components/top_bar_preview_kas.dart';

import '../../controllers/rekap_tahunan_controller.dart';

class RekapTahunanScreen extends StatelessWidget {
  RekapTahunanScreen({Key? key}) : super(key: key);

  final assetsConstant = DataWargaAssetsConstant();

  @override
  Widget build(BuildContext context) {
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
                  text: "Rekap Tahunan",
                  prefixIcon: Icons.arrow_back_ios_new_rounded,
                ),

                130.verticalSpace,

                // Button
                const Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,

                    // Button Container
                    child: TopBarRekapTahunan(
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
                    RekapTahunanController.to.currentIndex.value = x;
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
            10.verticalSpace,
            HeaderRekap(),
            15.verticalSpace,
            Expanded(
              child: SizedBox(
                child: TabBarView(
                  children: <Widget>[
                    // Blok A
                    // TODO: Replace the listDataWargaA code with your content for Blok A
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: EmptyRekap(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: EmptyRekap(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: EmptyRekap(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: EmptyRekap(),
                    ),
                    // Blok B
                    // TODO: Replace the listDataWargaB code with your content for Blok B

                    // Blok C
                    // TODO: Replace the listDataWargaC code with your content for Blok C

                    // Blok D
                    // TODO: Replace the listDataWargaD code with your content for Blok D
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
            color: (RekapTahunanController.to.currentIndex.value == index)
                ? const Color(0xFF6454F0)
                : Colors.grey,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
