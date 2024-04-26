// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class ImageField extends StatelessWidget {
  const ImageField({
    Key? key,
    this.isObscure = false,
  }) : super(key: key);

  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tambahkan gambar asset ke dalam Row
                Image.asset(
                  'assets/images/semen.png', // Gantilah dengan path gambar Anda
                  width: 204.w, // Sesuaikan lebar gambar
                  // Sesuaikan tinggi gambar
                  // Tambahan properti sesuai kebutuhan
                ),
                // Tambahkan widget lain atau modifikasi sesuai kebutuhan
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Atur agar teks rata kiri
                  children: [
                    Text(
                      "Beli Semen",
                      style: NunitoTextStyle.fw700.copyWith(fontSize: 18.sp),
                    ),
                    18.verticalSpace,
                    Text(
                      "Jumlah  : 50 Karung",
                      style: NunitoTextStyle.fw500,
                    ),
                    12.verticalSpace,
                    Text(
                      "Total   : Rp 1.000.000",
                      style: NunitoTextStyle.fw500,
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.verticalSpace
        ],
      ),
    );
  }
}
