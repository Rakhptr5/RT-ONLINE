import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:venturo_core/features/konfirmasi_pembayaran/view/components/button_gradient_konfirmasi.dart';
import 'package:venturo_core/features/konfirmasi_pembayaran/view/components/button_terbayar.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/button_terbayar.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class KonfirmasiPembayaranCard extends StatefulWidget {
  @override
  _KonfirmasiPembayaranCard createState() => _KonfirmasiPembayaranCard();
}

class _KonfirmasiPembayaranCard extends State<KonfirmasiPembayaranCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      decoration: ShapeDecoration(
          color: Colors.white,
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 8,
              offset: Offset(4, 3),
              spreadRadius: 0,
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                width: 59.w,
                height: 67.w,
                child: Container(
                  width: 25.w,
                  height: 55.w,
                  decoration: ShapeDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Que.jpeg'),
                          fit: BoxFit.cover),
                      shape: OvalBorder()),
                ),
              ),
              Positioned(
                bottom: 4.w,
                child: Container(
                  width: 35.w,
                  height: 14.w,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF094181),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "C-9",
                      style: NunitoTextStyle.fw600.copyWith(
                        color: const Color(0xFFE2DDFE),
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: Row(
            children: [
              Transform.translate(
                offset: Offset(-15, 0),
                child: Text(
                  "Ahmad Sujadi",
                  style: NunitoTextStyle.fw800.copyWith(fontSize: 17),
                ),
              ),
              12.horizontalSpace,
              ButtonTerbayar2()
            ],
          ),
          subtitle: Row(
            children: [
              Transform.translate(
                offset: Offset(-15, 0),
                child: Text(
                  "30 Okt 2023, 09:00",
                  style: NunitoTextStyle.fw600.copyWith(fontSize: 13),
                ),
              ),
              27.horizontalSpace,
              Text(
                "Rp 300.000",
                style: NunitoTextStyle.fw700.copyWith(fontSize: 15),
              ),
            ],
          ),
          // Judul ExpansionTile
          children: <Widget>[
            // Konten yang akan ditampilkan saat ekspansi
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage('assets/images/arrow_right.png'),
                  size: 20,
                ),
                8.horizontalSpace,
                Text(
                  "Month",
                  style: NunitoTextStyle.fw500.copyWith(fontSize: 15),
                ),
                205.horizontalSpace,
                Text(
                  "Rp 300.000",
                  style: NunitoTextStyle.fw500.copyWith(fontSize: 15),
                ),
              ],
            ),
            10.verticalSpace,
            Center(
              child: Container(
                color: const Color.fromARGB(255, 102, 102, 102),
                width: 360,
                height: 1,
              ),
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Pembayaran",
                  style: NunitoTextStyle.fw700.copyWith(fontSize: 17),
                ),
                120.horizontalSpace,
                Text(
                  "Rp 300.000",
                  style: NunitoTextStyle.fw700.copyWith(fontSize: 17),
                ),
              ],
            ),
            10.verticalSpace,
            Transform.translate(
                offset: Offset(110, 0),
                child: ButtonGradientKonfirmasi(onPressed: () {})),
            15.verticalSpace,
          ],

          onExpansionChanged: (bool expanding) =>
              setState(() => _isExpanded = expanding),
          // Icon yang akan berubah tergantung pada ekspansi
          initiallyExpanded: false,

          // Tetapkan apakah ekspansi awalnya terbuka atau tidak
        ),
      ),
    );
  }
}
