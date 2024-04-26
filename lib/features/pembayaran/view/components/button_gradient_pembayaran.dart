import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonGradientPembayaran extends StatelessWidget {
  const ButtonGradientPembayaran({
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
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: 382.w,
            height: 54.w,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16).w,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Chat WA",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
