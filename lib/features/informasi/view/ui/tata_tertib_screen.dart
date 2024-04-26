// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/informasi/view/components/tatib_card.dart';
import 'package:venturo_core/features/informasi/view/components/top_bar_informasi.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TataTertibScreen extends StatelessWidget {
  final String categoriesName;
  final String description;
  const TataTertibScreen(
      {Key? key, required this.categoriesName, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Top Bar Informasi
          TopBarInformasi(title: "Tata Tertib"),

          // Card Tata Tertib
          32.verticalSpace,
          Container(
            padding: EdgeInsets.all(12.w),
            width: 358.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 15,
                  offset: Offset(4, 5),
                  color: Color.fromRGBO(0, 0, 0, 0.10),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul Tata Tertib

                Text(
                  categoriesName,
                  style: NunitoTextStyle.fw700.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
                Divider(),
                Text(
                  description,
                  style: NunitoTextStyle.fw600.copyWith(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
