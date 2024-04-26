import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/laporan_keuangan_screen.dart';
import 'package:venturo_core/features/uang_keluar/view/components/detail_pemasukan_uang_masuk.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class UangKeluarCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailPemasukanUangKeluarScreen());
      },
      child: Container(
        width: 390.0,
        height: 170.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 8,
              offset: Offset(4, 3),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Jumat, 29 Oktober 2023',
                  style: NunitoTextStyle.fw800.copyWith(
                    color: Color.fromARGB(255, 100, 84, 240),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              Transform.translate(
                offset: Offset(-125, 0),
                child: Text(
                  'Renovasi Mushola',
                  style: NunitoTextStyle.fw700.copyWith(
                    fontSize: 14.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: Row(
                  children: [
                    Text(
                      'Beli Semen',
                      style: NunitoTextStyle.fw500.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                    175.horizontalSpace,
                    Text(
                      'Rp 1.000.000',
                      style: NunitoTextStyle.fw600.copyWith(
                        fontSize: 19.0,
                      ),
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              Transform.translate(
                offset: Offset(-123, 0),
                child: Text(
                  'Banyak : 50 Karung',
                  style: NunitoTextStyle.fw500.copyWith(
                    fontSize: 14.0,
                  ),
                ),
              ),
              5.verticalSpace,
              Transform.translate(
                offset: Offset(-118, 0),
                child: Text(
                  'Total  : Rp 1.000.000',
                  style: NunitoTextStyle.fw500.copyWith(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
