import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class TopBarAdmin extends StatelessWidget {
  const TopBarAdmin({
    Key? key,
    this.title,
    this.suffixIcon,
  }) : super(key: key);

  final String? title;
  final String? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw, // Use ScreenUtil to set width based on screen width
      height: 100.w,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF6EE2F5),
            Color(0xFF6454F0),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 18,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.w),
            width: 1.sw,
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: SizedBox(
                    width: 40.w,
                    height: 40.w,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const ImageIcon(
                        AssetImage("assets/images/ic_arrow_ios_left.png"),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  // Use Expanded to allow the title to occupy remaining space
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Text(
                      (title == null) ? 'Admin Area' : title!,
                      textAlign: TextAlign.center,
                      style: PoppinsTextStyle.fw600.copyWith(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: suffixIcon != null
                      ? SizedBox(
                          width: 40.w,
                          height: 40.w,
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              suffixIcon!,
                              height: 24.w,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(width: 40.w),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
