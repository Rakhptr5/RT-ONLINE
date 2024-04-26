// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:venturo_core/features/pembayaran/view/ui/pembayaran_screen.dart';
import 'package:venturo_core/features/profile/view/ui/profile_screen.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class RincianIuranCard extends StatefulWidget {
  const RincianIuranCard({
    Key? key,
    required this.profileName,
    required this.profileNumber,
  }) : super(key: key);

  final String profileName;
  final String profileNumber;

  @override
  _RincianIuranCardState createState() => _RincianIuranCardState();
}

class _RincianIuranCardState extends State<RincianIuranCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.w),

      //Container Putih
      child: GestureDetector(
        onTap: () {
          Get.to(PembayaranScreen());
        },
        child: Container(
          width: 358.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 8,
                offset: Offset(4, 3),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        color: isChecked ? Color(0xFF6454F0) : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: isChecked
                            ? null
                            : Border.all(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                      ),
                      child: isChecked
                          ? Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18.w,
                              ),
                            )
                          : null,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 80.0),
                    child: SizedBox(
                      width: 110.w,
                      child: Text(
                        widget.profileName,
                        style: NunitoTextStyle.fw600.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  4.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(right: 80.0),
                    child: SizedBox(
                      width: 110.w,
                      child: Text(
                        widget.profileNumber,
                        style: NunitoTextStyle.fw400.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1.0),
                child: Container(
                  width: 100,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFF27D18A),
                  ),
                  child: Center(
                    child: Text(
                      'Terbayarkan',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
