// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TextFieldPengeluaran extends StatelessWidget {
  const TextFieldPengeluaran({
    Key? key,
    this.isObscure = false,
    this.label,
    this.hint,
  }) : super(key: key);

  final bool isObscure;
  final String? label;

  final String? hint;

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
          // Label
          if (label != null)
            Text(
              label!,
              style: NunitoTextStyle.fw700.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 14.sp,
              ),
            ),

          // Container
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Expanded(
                  // Textfield
                  child: TextField(
                    controller: TextEditingController(),
                    enabled: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: NunitoTextStyle.fw400.copyWith(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14.sp,
                      ),
                    ),
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
