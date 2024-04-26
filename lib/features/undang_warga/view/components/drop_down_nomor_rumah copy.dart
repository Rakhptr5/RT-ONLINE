import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DropDownIuran extends StatelessWidget {
  DropDownIuran({
    Key? key,
    this.label,
    required this.icon,
    required this.hint,
    this.textInputType,
    this.controller,
  }) : super(key: key);

  final String? label;
  final String? icon;
  final String hint;
  final TextInputType? textInputType;

  final TextEditingController? controller;

  final List<String> items = [
    "Rp 100.000",
    "Rp 200.000",
    "Rp 300.000",
    "Rp 400.000",
    "Rp 500.000",
    "Rp 600.000",
    "Rp 700.000",
    "Rp 800.000",
    "Rp 900.000",
    "Rp 1.000.000",
    "Rp 1.100.000",
    "Rp 1.200.000",
    "Rp 1.300.000",
    "Rp 1.400.000",
    "Rp 1.500.000",
  ];

  String? selectedValue;

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
            color: Color(0xFFEFF0F5),
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            height: 40.w,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                style: NunitoTextStyle.fw400.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 14.sp,
                ),
                icon: const ImageIcon(
                    AssetImage("assets/images/ic_arrow_ios_down.png")),
                isExpanded: true,
                hint: Text(
                  hint,
                  style: const TextStyle(
                    color: Color(0xFF9597A3), // Ubah warna teks hint
                  ),
                ),
                items: items
                    .map(
                      (String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    selectedValue = value;
                    controller?.text = value;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
