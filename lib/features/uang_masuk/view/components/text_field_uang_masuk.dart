import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TextFieldUangMasuk2 extends StatelessWidget {
  const TextFieldUangMasuk2({
    Key? key,
    this.isObscure = false,
    this.label,
    this.icon,
    this.hint,
    this.textInputType,
    this.onTap,
    this.controller,
  }) : super(key: key);

  final bool isObscure;
  final String? label;
  final String? icon;
  final String? hint;
  final TextInputType? textInputType;
  final void Function()? onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      height: 45,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            // Button
            GestureDetector(
              onTap: onTap,
              child:
                  (icon != null) ? ImageIcon(AssetImage(icon!)) : Container(),
            ),
            10.horizontalSpace,
            Container(
              height: 25,
              width: 1.5,
              color: Colors.grey,
            ),
            10.horizontalSpace,
            Expanded(
              // Textfield
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextField(
                  obscureText: isObscure,
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: NunitoTextStyle.fw400.copyWith(
                      color: const Color(0xFF9597A3),
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget bar({
  bool showIcon = true,
  bool showText = true,
  required String icon,
  required String text,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(16.w),
      width: 382.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(4, 3),
            color: Color.fromRGBO(0, 0, 0, 0.10),
          ),
        ],
      ),
      child: SizedBox(
        height: 30.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon
            showIcon
                ? SizedBox(
                    width: 30.w,
                    child: ImageIcon(
                      AssetImage(icon),
                      color: const Color(0xff6454F0),
                    ),
                  )
                : const SizedBox(),

            // Text
            showText
                ? SizedBox(
                    width: 278.w - 32.w,
                    child: Text(
                      text,
                      style: NunitoTextStyle.fw500.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 16.sp,
                      ),
                    ),
                  )
                : const SizedBox(),

            // Button Icon
            SizedBox(
              width: 24.w,
              child: const ImageIcon(
                AssetImage("assets/images/ic_arrow_ios_right.png"),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
