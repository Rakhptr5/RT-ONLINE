// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/data_warga/view/components/button_gradient_data_warga.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

import 'button_gradient_data_warga.dart';

class LaporanPembayaranBottomsheet extends StatelessWidget {
  const LaporanPembayaranBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    // Container
    return Container(
      width: 430.w,
      height: 490.w,
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
            width: 10.w,
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
              'November - 2023',
              style: PoppinsTextStyle.fw600.copyWith(
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
          ),

          // Profile
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Container
              Container(
                padding: EdgeInsets.all(8.w),
                width: 148.w,
                height: 148.w,

                // Profile Image
                child: Container(
                  width: 132.w,
                  height: 132.w,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Que.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),

              // Blok
              Positioned(
                bottom: 4.w,
                child: Container(
                  width: 55.w,
                  height: 26.w,
                  padding: EdgeInsets.symmetric(vertical: 4.w),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF094181),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),

                  // Text
                  child: Center(
                    child: Text(
                      'A-20',
                      style: NunitoTextStyle.fw700.copyWith(
                        color: const Color(0xFFE2DDFE),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          8.verticalSpace,

          // Text Nama
          Center(
            child: Text(
              'Ahmad Sujadi',
              style: PoppinsTextStyle.fw600.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 20.sp,
              ),
            ),
          ),

          15.verticalSpace,

          // Text tgl
          const TextFieldDetailWarga(
            label: "Status",
            tanggal: "Terbayar",
          ),

          15.verticalSpace,
          const TextFieldDetailWarga(
            label: "Tanggal Pembayaran",
            tanggal: "02 November 2023",
          ),

          15.verticalSpace,

          const TextFieldDetailWarga(
            label: "Dikonfirmasi Oleh",
            tanggal: "Ali Sodikin",
          ),

          15.verticalSpace,
          const TextFields(
            labels: "Bukti Pembayaran",
          ),

          10.verticalSpace,

          ButtonImages(imagePath: 'assets/images/imagus.png', onPressed: () {})
        ],
      ),
    );
  }
}

class TextFieldDetailWarga extends StatelessWidget {
  const TextFieldDetailWarga({
    Key? key,
    required this.label,
    required this.tanggal,
  }) : super(key: key);

  final String label;
  final String tanggal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 382.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: NunitoTextStyle.fw700.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 14.sp,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
            height: 38.w,
            child: TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
              readOnly: true,
              controller: TextEditingController(text: tanggal),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  const TextFields({
    Key? key,
    required this.labels,
  }) : super(key: key);

  final String labels;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 382.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labels,
            style: NunitoTextStyle.fw700.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 14.sp,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
          ),
        ],
      ),
    );
  }
}
