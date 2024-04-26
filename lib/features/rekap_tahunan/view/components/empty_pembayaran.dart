import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class EmptyRekap extends StatelessWidget {
  const EmptyRekap({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 10.w,
        child: Center(
          child: Column(
            children: [
              // Image
              Image.asset(
                'assets/images/framess.png',
                fit: BoxFit.fill,
              ),
              // Add more widgets or content here if needed
            ],
          ),
        ),
      ),
    );
  }
}
