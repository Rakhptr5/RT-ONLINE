// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/detail_pemasukan/view/components/button_gradient_pemasukan.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TextFieldPemasukan extends StatelessWidget {
  const TextFieldPemasukan({
    Key? key,
    this.isObscure = false,
    this.label,
    this.onTap,
    this.controller,
  }) : super(key: key);

  final bool isObscure;
  final String? label;

  final void Function()? onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          if (label != null)
            Text(
              label!,
              style: NunitoTextStyle.fw700.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 14.sp,
              ),
            ),
          5.verticalSpace,
          ButtonImagesPemasukan()
        ],
      ),
    );
  }
}
