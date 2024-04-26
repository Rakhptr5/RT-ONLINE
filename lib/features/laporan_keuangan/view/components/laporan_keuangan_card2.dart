// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_bottomsheet.dart';
import 'package:venturo_core/features/detail_pemasukan/view/ui/detail_pemasukan_screen.dart';
import 'package:venturo_core/features/detail_pengeluaran/view/ui/detail_pengeluaran_screen.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/button_terbayar.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class LaporanKeuanganCard2 extends StatelessWidget {
  const LaporanKeuanganCard2({
    Key? key,
    required this.profileName,
    required this.profileNumber,
  }) : super(key: key);

  final String profileName;
  final String profileNumber;

  @override
  Widget build(BuildContext context) {
    // Container
    return Padding(
      padding: EdgeInsets.only(bottom: 15.w),
      child: GestureDetector(
        onTap: () {
          Get.to(DetailPengeluaranScreen());
        },
        child: Container(
          width: 358.w,
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 8.w),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 8,
                offset: Offset(4, 3),
                spreadRadius: 0,
              )
            ],
          ),

          // Row
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Profile
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // Container
                  Container(
                    width: 14.w,
                  ),

                  // Blok
                ],
              ),

              // Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Box
                  SizedBox(
                    width: 212.w,

                    // Text
                    child: Text(
                      profileName,
                      style: NunitoTextStyle.fw800.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 16.sp,
                      ),
                    ),
                  ),

                  4.verticalSpace,

                  // Box

                  // Text
                  Text(
                    profileNumber,
                    style: NunitoTextStyle.fw400.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),

              // Additional text to the right

              Text(
                'Rp 1.000.000',
                style: NunitoTextStyle.fw800.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 19.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
