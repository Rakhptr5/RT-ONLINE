import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class ContainerKeuangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 100,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(4, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                'Saldo Akhir',
                style: NunitoTextStyle.fw600.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 20.sp,
                ),
              ),
            ),
            3.verticalSpace,
            Text(
              'Rp. 10.000.000',
              style: NunitoTextStyle.fw800.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 24.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
