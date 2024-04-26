import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class ButtonGradientUang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 110,
          height: 35,
          child: Image.asset(
            'assets/images/Button.png', // Ganti dengan path dari gambar Anda
            fit: BoxFit.fill,
          )),
    );
  }
}
