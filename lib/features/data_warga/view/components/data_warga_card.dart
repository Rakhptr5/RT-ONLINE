import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_bottomsheet.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DataWargaCard extends StatefulWidget {
  const DataWargaCard({
    Key? key,
    required this.name,
    required this.phone_number,
    required this.photo_url,
    required this.date_of_birth,
  }) : super(key: key);

  final String name;
  final String phone_number;
  final String photo_url;
  final String date_of_birth;
  factory DataWargaCard.fromJson(Map<String, dynamic> json) => DataWargaCard(
        name: json['name'],
        phone_number: json['phone_number'],
        photo_url: json['photo_url'],
        date_of_birth: json['date_of_birth'],
      );
  @override
  _DataWargaCardState createState() => _DataWargaCardState();
}

late Future<List<DataWargaCard>> warga;
Future<List<DataWargaCard>> getWarga() async {
  final response =
      await get(Uri.parse("https://rtonline-api.venturo.pro/api/v1/citizen"));
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    // Print response body to see its structure
    List<DataWargaCard> warga = List<DataWargaCard>.from(
        jsonResponse['data']['list'].map((e) => DataWargaCard.fromJson(e)));
    //for (var k in jsonResponse) {
    //KategoriInfo kategori = KategoriInfo.fromJson(k);
    //kategoriInfo.add(kategori);
    //}
    return warga;
  } else {
    throw Exception('Error wak');
  }
}

class _DataWargaCardState extends State<DataWargaCard> {
  @override
  Widget build(BuildContext context) {
    // Container
    return Padding(
      padding: EdgeInsets.only(bottom: 15.w, left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return DataWargaBottomsheet(
                  name: widget.name,
                  date_of_birth: widget.date_of_birth,
                  phone_number: widget.phone_number,
                  photo_url: widget.photo_url,
                );
              });
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

          // Row
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Profile
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // Container
                  Container(
                    padding: EdgeInsets.all(8.w),
                    width: 66.w,
                    height: 66.w,

                    // Profile Image
                    child: Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.photo_url),
                          fit: BoxFit.cover,
                        ),
                        shape: const OvalBorder(),
                      ),
                    ),
                  ),

                  // Blok
                  Positioned(
                    bottom: 4.w,
                    child: Container(
                      width: 35.w,
                      height: 14.w,
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF094181),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Center(
                        child: Text(
                          "A-21",
                          style: NunitoTextStyle.fw600.copyWith(
                            color: const Color(0xFFE2DDFE),
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Box
                  SizedBox(
                    width: 228.w,

                    // Text
                    child: Text(
                      widget.name,
                      style: NunitoTextStyle.fw600.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 16.sp,
                      ),
                    ),
                  ),

                  4.verticalSpace,

                  // Box
                  SizedBox(
                    width: 228.w,

                    // Text
                    child: Text(
                      widget.phone_number,
                      style: NunitoTextStyle.fw400.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 14.sp,
                      ),
                    ),
                  )
                ],
              ),

              // Icons
              Container(
                width: 48.w,
                height: 32.w,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: SizedBox(
                  width: 32.w,
                  height: 32.w,
                  child: const ImageIcon(
                    AssetImage("assets/images/ic_whatsapp.png"),
                    color: Color(0xff27D18A),
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
