import 'dart:convert';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/edit_announcement.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_bottomsheet.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class AdminPengumumanCard extends StatefulWidget {
  const AdminPengumumanCard({
    Key? key,
    required this.title,
    required this.description,
    required this.id,
    required this.pinned,
  }) : super(key: key);

  final String title;
  final String description;
  final String id;
  final int pinned;
  factory AdminPengumumanCard.fromJson(Map<String, dynamic> json) =>
      AdminPengumumanCard(
        title: json['title'],
        description: json['description'],
        id: json['id'],
        pinned: json['is_pinned'],
      );

  @override
  _AdminInfoCardState createState() => _AdminInfoCardState();
}

class _AdminInfoCardState extends State<AdminPengumumanCard> {
  late bool switchValue; // State untuk menyimpan nilai switch

  @override
  void initState() {
    super.initState();
    switchValue = false; // Set nilai awal switch
  }

  @override
  Widget build(BuildContext context) {
    // Container
    return Padding(
      padding: EdgeInsets.only(bottom: 15.w, left: 10, right: 10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 129.h,
          width: 1.sw,
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
            children: [
              // Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: NunitoTextStyle.fw800.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 18.sp,
                        ),
                      ),
                    ),

                    4.verticalSpace,

                    // Box
                    SizedBox(
                      width: 170.w,

                      // Text
                      child: Text(
                        widget.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: NunitoTextStyle.fw400.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 16.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Switch(
                value: switchValue,
                onChanged: (bool newValue) {
                  setState(() {
                    switchValue =
                        newValue; // Perbarui nilai switch saat berubah
                    // Di sini tambahkan logika yang diperlukan sesuai dengan nilai switch yang baru
                  });
                },
                activeColor: Color.fromARGB(255, 100, 84, 240),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
              ),

              // Icons Edit
              GestureDetector(
                onTap: () {
                  // Navigasi ke halaman Edit Announcement
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAnnouncementPage(
                        announcementId: widget.id,
                        id: widget.id,
                        title: widget.title,
                        pinned: widget.pinned,
                        description: widget.description,
                      ),
                    ),
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
