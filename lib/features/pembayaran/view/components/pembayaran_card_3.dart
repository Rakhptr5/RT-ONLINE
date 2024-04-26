import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class PembayaranCard3 extends StatefulWidget {
  @override
  _PembayaranCard3State createState() => _PembayaranCard3State();
}

class _PembayaranCard3State extends State<PembayaranCard3> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
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
          title: Text(
            "Qris",
            style: NunitoTextStyle.fw600.copyWith(fontSize: 18),
          ),

          // Judul ExpansionTile
          children: <Widget>[
            // Konten yang akan ditampilkan saat ekspansi

            Center(
              child: Container(
                color: const Color.fromARGB(255, 102, 102, 102),
                width: 335,
                height: 1,
              ),
            ),
            10.verticalSpace,
            QrImageView(
              data: '1234567890',
              gapless: true,
              version: 10,
              size: 170.0,
            ),
            10.verticalSpace,

            // Tambahkan widget sesuai kebutuhan
          ],

          trailing: _isExpanded
              ? ImageIcon(AssetImage('assets/images/arrow_right.png'))
              : ImageIcon(AssetImage('assets/images/arrow_right.png')),
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
