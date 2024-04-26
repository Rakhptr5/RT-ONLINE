import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class PembayaranCard2 extends StatefulWidget {
  @override
  _PembayaranCard2State createState() => _PembayaranCard2State();
}

class _PembayaranCard2State extends State<PembayaranCard2> {
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
            "Bank Transfer",
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
            Padding(
              padding: const EdgeInsets.only(left: 44.0),
              child: Row(
                children: [
                  Transform.translate(
                    offset: Offset(-20, 0),
                    child: Image.asset(
                      'assets/images/BCA.png',
                      width: 100,
                      height: 60,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("801 - 234 - 5678",
                          style: NunitoTextStyle.fw700.copyWith(fontSize: 16)),
                      Row(
                        children: [
                          Text("An. Rojali Sudirman",
                              style:
                                  NunitoTextStyle.fw800.copyWith(fontSize: 14)),
                          36.horizontalSpace,
                          Transform.translate(
                              offset: Offset(0, -10),
                              child: GestureDetector(
                                onTap: () {},
                                child: ImageIcon(
                                  AssetImage('assets/images/kotak_icon.png'),
                                  color: Color.fromARGB(255, 9, 65, 130),
                                ),
                              ))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            8.verticalSpace,
            Center(
              child: Container(
                color: const Color.fromARGB(255, 102, 102, 102),
                width: 335,
                height: 1,
              ),
            ),

            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 44.0),
              child: Row(
                children: [
                  Transform.translate(
                    offset: Offset(-20, 0),
                    child: Image.asset(
                      'assets/images/Mandiri.png',
                      width: 100,
                      height: 60,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("8012 - 3456 - 78901",
                          style: NunitoTextStyle.fw700.copyWith(fontSize: 16)),
                      Row(
                        children: [
                          Text("An. Rojali Sudirman",
                              style:
                                  NunitoTextStyle.fw800.copyWith(fontSize: 14)),
                          36.horizontalSpace,
                          Transform.translate(
                              offset: Offset(0, -10),
                              child: GestureDetector(
                                onTap: () {},
                                child: ImageIcon(
                                  AssetImage('assets/images/kotak_icon.png'),
                                  color: Color.fromARGB(255, 9, 65, 130),
                                ),
                              ))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),

            20.verticalSpace,

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
