import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class HeaderRekap extends StatelessWidget {
  const HeaderRekap({super.key});

  @override
  Widget build(BuildContext context) {
    // Container Column Image, Text
    return SizedBox(
      width: 188.w,
      child: Center(
        child: Column(
          children: [
            // Image
            Image.asset(
              'assets/images/Legends.png',
              fit: BoxFit.fill,
              width: 500,
              height: 17,
            ),
          ],
        ),
      ),
    );
  }
}
