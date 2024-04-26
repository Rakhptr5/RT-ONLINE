import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TatibContentDua extends StatelessWidget {
  const TatibContentDua({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
      width: 334.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildListText(1,
              "RT 58 berada dibawah RW 13, Kelurahan Munjul Jaya, Kecamatan Purwakarta – Kabupaten Purwakarta – Jawa Barat."),
          buildListText(2,
              "Warga RT 58 adalah warga yang menetap dan tinggal di wilayah RT 58 RW 13 Perum Pondok Griya Jaya Indah, baik dirumah milik sendiri ataupun kontrakan."),
        ],
      ),
    );
  }

  Widget buildListText(int number, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$number.",
            style: NunitoTextStyle.fw400.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 14.sp,
            ),
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: Text(
              text,
              style: NunitoTextStyle.fw400.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
