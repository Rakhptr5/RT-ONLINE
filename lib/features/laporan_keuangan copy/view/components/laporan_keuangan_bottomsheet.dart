// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:venturo_core/features/data_warga/view/components/button_gradient_data_warga.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/button_batal_simpan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/filter_tanggal.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/laporan_keuangan_screen.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/button_gradient_data_warga.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class LaporanKeuanganBottomsheet extends StatelessWidget {
  const LaporanKeuanganBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    // Container
    return Container(
      width: 430.w,
      height: 700.w,
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
          // Bar
          Container(
            width: 2.w,
            height: 5.w,
            decoration: ShapeDecoration(
              color: const Color(0xFF0B0C0D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),

          // Text
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.w),
            height: 30.w,
            child: Text(
              textAlign: TextAlign.center,
              'Filter Tanggal',
              style: PoppinsTextStyle.fw600.copyWith(
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
          ),

          FilterTanggal(),
          //
          15.verticalSpace,

          // Text tgl
          const TextFieldKeuangan(
            tanggal: "Tahun Ini",
          ),

          20.verticalSpace,
          const TextFieldKeuangan(
            tanggal: "Tahun Lalu",
          ),
          20.verticalSpace,
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: BatalSimpan(),
          ),
          30.verticalSpace,
        ],
      ),
    );
  }
}

class TextFieldKeuangan extends StatelessWidget {
  const TextFieldKeuangan({
    Key? key,
    required this.tanggal,
  }) : super(key: key);

  final String tanggal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 382.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
            decoration: BoxDecoration(
              color: Color(0xFFEFF0F5),
              borderRadius: BorderRadius.circular(4),
              border: Border(
                  bottom: BorderSide(color: Color(0xFFEFF0F5), width: 1),
                  top: BorderSide(color: Color(0xFFEFF0F5), width: 1),
                  right: BorderSide(color: Color(0xFFEFF0F5), width: 1),
                  left: BorderSide(color: Color(0xFFEFF0F5), width: 1)),
            ),
            height: 38.w,
            child: TextField(
              style: NunitoTextStyle.fw700.copyWith(fontSize: 12.sp),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
              readOnly: true,
              controller: TextEditingController(
                text: tanggal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
