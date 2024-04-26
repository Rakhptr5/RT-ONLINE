import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class PembayaranCard extends StatefulWidget {
  @override
  _PembayaranCardState createState() => _PembayaranCardState();
}

class _PembayaranCardState extends State<PembayaranCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Row(
            children: [
              Transform.translate(
                offset: Offset(-10, 0),
                child: Text(
                  "Oktober",
                  style: NunitoTextStyle.fw800.copyWith(fontSize: 17),
                ),
              ),
              120.horizontalSpace,
              Text(
                "Rp 300.000",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 16),
              ),
            ],
          ), // Judul ExpansionTile
          children: <Widget>[
            // Konten yang akan ditampilkan saat ekspansi

            Padding(
              padding: const EdgeInsets.only(left: 44.0),
              child: Row(
                children: [
                  Text("Iuran Pengelolaan", style: NunitoTextStyle.fw600),
                  92.horizontalSpace,
                  Text("Rp 100.000", style: NunitoTextStyle.fw600)
                ],
              ),
            ),
            8.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: Container(
                color: Colors.grey,
                width: 290,
                height: 1,
              ),
            ),
            15.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 44.0),
              child: Row(
                children: [
                  Text("Iuran Pengelolaan", style: NunitoTextStyle.fw600),
                  92.horizontalSpace,
                  Text("Rp 100.000", style: NunitoTextStyle.fw600)
                ],
              ),
            ),
            8.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: Container(
                color: Colors.grey,
                width: 290,
                height: 1,
              ),
            ),
            15.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 44.0),
              child: Row(
                children: [
                  Text("Iuran Pengelolaan", style: NunitoTextStyle.fw600),
                  92.horizontalSpace,
                  Text("Rp 100.000", style: NunitoTextStyle.fw600)
                ],
              ),
            ),
            20.verticalSpace,
            Center(
              child: Container(
                color: const Color.fromARGB(255, 102, 102, 102),
                width: 320,
                height: 0.5,
              ),
            ),

            10.verticalSpace,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Pembayaran",
                  style: NunitoTextStyle.fw700.copyWith(fontSize: 18),
                ),
                63.horizontalSpace,
                Text(
                  "Rp 300.000",
                  style: NunitoTextStyle.fw700.copyWith(fontSize: 18),
                ),
              ],
            ),

            20.verticalSpace,
            // Tambahkan widget sesuai kebutuhan
          ],
          onExpansionChanged: (bool expanding) =>
              setState(() => _isExpanded = expanding),
          // Icon yang akan berubah tergantung pada ekspansi
          initiallyExpanded: false,
          controlAffinity: ListTileControlAffinity.leading,
          // Tetapkan apakah ekspansi awalnya terbuka atau tidak
        ),
      ),
    );
  }
}
