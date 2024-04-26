import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TextFieldEditGeneral3 extends StatelessWidget {
  const TextFieldEditGeneral3({
    Key? key,
    required this.label,
    required this.tanggal,
  }) : super(key: key);

  final String label;
  final String tanggal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 382.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: NunitoTextStyle.fw700.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 14.sp,
                ),
              ),
              320.horizontalSpace,
              Icon(
                Icons.close,
                size: 18,
              ),
              10.verticalSpace
            ],
          ),
          10.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
            decoration: ShapeDecoration(
                shadows: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 8,
                    offset: Offset(4, 3),
                    spreadRadius: 0,
                  )
                ],
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                )),
            height: 38.w,
            child: TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
              controller: TextEditingController(text: tanggal),
            ),
          ),
        ],
      ),
    );
  }
}
