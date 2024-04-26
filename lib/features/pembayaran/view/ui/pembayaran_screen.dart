import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/pembayaran/view/components/button_gradient_pembayaran.dart';
import 'package:venturo_core/features/pembayaran/view/components/pembayaran_card_2.dart';
import 'package:venturo_core/features/pembayaran/view/components/pembayaran_card_3.dart';
import 'package:venturo_core/features/pembayaran/view/components/upload_gambar.dart';
import 'package:venturo_core/features/struktur_rt/constants/struktur_rt_assets_constant.dart';
import 'package:venturo_core/features/struktur_rt/view/components/empty_struktur_rt.dart';
import 'package:venturo_core/features/struktur_rt/view/components/top_bar_struktur_rt.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

import '../../constants/pembayaran_assets_constant.dart';
import '../components/pembayaran_card.dart';

import '../components/top_bar_pembayaran.dart';

class PembayaranScreen extends StatelessWidget {
  PembayaranScreen({Key? key}) : super(key: key);

  final assetsConstant = PembayaranAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Topbar
            const TopBarPembayaran(),

            20.verticalSpace,

            // Empty
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "9 Oktober 2023 08:00",
                  style: NunitoTextStyle.fw800.copyWith(fontSize: 18),
                ),
                35.horizontalSpace,
                Text(
                  "No: RT - 01/1234",
                  style: NunitoTextStyle.fw800.copyWith(fontSize: 18),
                ),
              ],
            ),

            30.verticalSpace,
            PembayaranCard(),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 155.0),
              child: Text(
                "Metode Pembayaran",
                style: PoppinsTextStyle.fw600.copyWith(fontSize: 20),
              ),
            ),
            10.verticalSpace,
            PembayaranCard2(),
            10.verticalSpace,
            PembayaranCard3(),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 245.0),
              child: Text(
                "Upload Gambar",
                style: TextStyle(fontFamily: "NunitoBold", fontSize: 15),
              ),
            ),
            10.verticalSpace,
            UploadGambar(),
            30.verticalSpace,
            ButtonGradientPembayaran(onPressed: () {}), 10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
