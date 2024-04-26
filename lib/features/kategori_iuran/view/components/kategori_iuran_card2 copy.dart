import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:venturo_core/features/admin_informasi/view/components/edit_information.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_bottomsheet.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class KategoriIuranCard extends StatefulWidget {
  const KategoriIuranCard({
    Key? key,
    required this.nominal,
    required this.name,
    required this.id,
  }) : super(key: key);
  final int nominal;
  final String name;
  final String id;
  factory KategoriIuranCard.fromJson(Map<String, dynamic> json) {
    return KategoriIuranCard(
      id: json['id'],
      name: json['name'],
      nominal: json['nominal'],
    );
  }
  @override
  _KategoriIuranCardState createState() => _KategoriIuranCardState();
}

late Future<List<KategoriIuranCard>> info;

class _KategoriIuranCardState extends State<KategoriIuranCard> {
  @override
  Widget build(BuildContext context) {
    // Container
    return Padding(
      padding: EdgeInsets.only(bottom: 15.w, left: 10, right: 10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 110.h,
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

          // Row
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Profile

              // Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Box
                  SizedBox(
                    width: 228.w,

                    // Text
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.name,
                        style: NunitoTextStyle.fw800.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),

                  4.verticalSpace,

                  // Box
                  SizedBox(
                    width: 228.w,

                    // Text
                    child: Text(
                      widget.nominal.toString(),
                      style: NunitoTextStyle.fw400.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 16.sp,
                      ),
                    ),
                  )
                ],
              ),

              // Icons Edit
              GestureDetector(
                onTap: () {
                  // Navigate to Edit Information page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditInformasiPage()),
                  );
                },
                child: Container(
                  width: 48.w,
                  height: 32.w,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: SizedBox(
                    width: 32.w,
                    height: 32.w,
                    child: const ImageIcon(
                      AssetImage("assets/images/edit.png"),
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
