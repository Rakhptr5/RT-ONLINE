// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:venturo_core/features/beranda/view/components/alert_keuangan_beranda.dart';

import 'package:venturo_core/features/beranda/view/components/header_beranda.dart';
import 'package:venturo_core/features/beranda/view/components/preview_saldo_kas_card2.dart';
import 'package:venturo_core/features/beranda/view/components/preview_saldo_kas_card3.dart';

import 'package:venturo_core/features/beranda/view/components/top_bar_preview_kas.dart';

import '../../../../configs/routes/route.dart';

class PreviewSaldoKasAdminScreen extends StatelessWidget {
  const PreviewSaldoKasAdminScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFF0F5),
      body: SizedBox(
        height: double.maxFinite,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      // TopBar
                      const HeaderBeranda(
                        text: "Preview",
                        prefixIcon: Icons.arrow_back_ios_new_rounded,
                      ),

                      130.verticalSpace,

                      // Button
                      const Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,

                          // Button Container
                          child: TopBarPreviewKas(
                            text: "2023",
                          ),
                        ),
                      )
                    ],
                  ),

                  27.verticalSpace,

                  // Card
                  const PreviewSaldoKasCard2(
                    bulan: "November",
                    note: "*) Data Update pertanggal 17 Nov 2023, 13.00 WIB",
                  ),

                  // Card
                  const PreviewSaldoKasCard2(
                    bulan: "Oktober",
                  ),
                  const PreviewSaldoKasCard3(
                    bulan: "September",
                  ),
                ],
              ),
            ),

            // Alert
            Positioned(
              right: 0,
              bottom: 30.w,
              child: GestureDetector(
                onTap: () {
                  // Add your onTap functionality here
                  // For example, navigate to another screen or show a dialog
                  Get.toNamed(Routes.laporanKeuanganAdminRoute);
                },
                child: const AlertKeuanganBeranda(),
              ),
            ),

            // Image
            Positioned(
              right: 0.w,
              bottom: 6.w,
              child: SizedBox(
                child: Image.asset("assets/images/paper_pen.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
