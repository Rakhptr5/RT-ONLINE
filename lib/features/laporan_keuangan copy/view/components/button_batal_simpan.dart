import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/laporan_keuangan_screen.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class BatalSimpan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 167,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Text(
                      'Batal',
                      style: NunitoTextStyle.fw700
                          .copyWith(color: Color(0xFF6454F0), fontSize: 15.sp),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // Aksi yang akan dijalankan saat tombol Batal ditekan
                      Get.back();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        6.horizontalSpace,

        // Container Gradient dengan efek ripple
        Stack(
          children: [
            InkWell(
              onTap: () {
                // Aksi yang akan dijalankan saat tombol Simpan ditekan
                Get.back();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 167,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF6EE2F5), Color(0xFF6454F0)],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Simpan',
                      style: NunitoTextStyle.fw700
                          .copyWith(color: Colors.white, fontSize: 15.sp),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // Aksi yang akan dijalankan saat tombol Simpan ditekan
                      Get.back();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
