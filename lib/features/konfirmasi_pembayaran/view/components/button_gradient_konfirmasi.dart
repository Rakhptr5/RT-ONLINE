import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class ButtonGradientKonfirmasi extends StatelessWidget {
  const ButtonGradientKonfirmasi({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF6EE2F5),
                Color(0xFF6454F0),
              ], // Sesuaikan dengan warna yang diinginkan
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Container(
            width: 140.w,
            height: 45.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                10.horizontalSpace,
                ImageIcon(
                  AssetImage('assets/images/check_circle.png'),
                  size: 22,
                  color: Colors.white,
                ),
                15.horizontalSpace,
                Text("Konfirmasi",
                    style: NunitoTextStyle.fw700
                        .copyWith(fontSize: 13, color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
