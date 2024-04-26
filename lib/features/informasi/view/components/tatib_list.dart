import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TatibCards extends StatefulWidget {
  const TatibCards({
    Key? key,
    this.onTap,
    required this.description,
    required this.categoriesName, // Add required categoriesName parameter
  }) : super(key: key);

  final void Function()? onTap;
  final String categoriesName;
  final String description; // Declare categoriesName parameter

  @override
  _TatibCardsState createState() => _TatibCardsState();
}

class _TatibCardsState extends State<TatibCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(16.w),
          width: 350.w,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Icon
                SizedBox(
                  width: 30.w,
                  child: const ImageIcon(
                    AssetImage("assets/images/ic_tertib_fill.png"),
                    color: Color(0xff6454F0),
                  ),
                ),

                // Text
                20.horizontalSpace,
                Text(
                  widget.categoriesName, // Use categoriesName from widget
                  style: NunitoTextStyle.fw500.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 16.sp,
                  ),
                ),
                Spacer(),
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
      ),
    );
  }
}
