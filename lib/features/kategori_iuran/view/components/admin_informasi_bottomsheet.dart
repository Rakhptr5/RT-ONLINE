// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/admin_informasi/view/components/button_gradient_admin.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/button_gradient_admin.dart';
import 'package:venturo_core/features/data_warga/view/components/button_gradient_data_warga.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class KategoriIuranBottomsheet extends StatefulWidget {
  const KategoriIuranBottomsheet({Key? key}) : super(key: key);

  @override
  _KategoriIuranBottomsheetState createState() =>
      _KategoriIuranBottomsheetState();
}

class _KategoriIuranBottomsheetState extends State<KategoriIuranBottomsheet> {
  @override
  Widget build(BuildContext context) {
    // Container
    return Container(
      width: 430.w,
      height: 370.w,
      padding: EdgeInsets.only(
        top: 12.w,
        left: 24.w,
        right: 24.w,
        bottom: 0.w,
      ),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      child: ListView(
        children: [
          Container(
            width: 10.w,
            height: 5.w,
            decoration: ShapeDecoration(
              color: const Color(0xFF0B0C0D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),

          // Text
          10.verticalSpace,
          Column(
            children: [
              Text(
                "Riwayat Edit",
                style: PoppinsTextStyle.fw700.copyWith(fontSize: 20),
              ),
              20.verticalSpace,
              Image.asset('assets/images/riwayat.png')
              //taruh asset image disini ini
            ],
          )
        ],
      ),
    );
  }
}
