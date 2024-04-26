import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:venturo_core/features/pengumuman_banner/controllers/detail_banner_controller.dart';
import 'package:venturo_core/features/pengumuman_banner/view/components/detail_banner_card.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DetailPengumumanCard extends StatefulWidget {
  DetailPengumumanCard({super.key});

  @override
  _DetailPengumumanCardState createState() => _DetailPengumumanCardState();
}

class _DetailPengumumanCardState extends State<DetailPengumumanCard> {
  late String title = "";
  // late String photo_url = "";
  late String description = "";
  late String created_at = "";
  DetailBannerController controller = Get.put(DetailBannerController());
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Method untuk mengambil data dari API
  Future<void> fetchData() async {
    try {
      final response = await get(
          Uri.parse('https://rtonline-api.venturo.pro/api/v1/announcements'));
      if (response.statusCode == 200) {
        print(response.body); // Print the response body for debugging
        final Map<String, dynamic> data = json.decode(response.body);

        // Pastikan properti "data" dan "list" ada dalam respons JSON
        if (data.containsKey('data') && data['data'].containsKey('list')) {
          // Ambil daftar pengumuman
          List<dynamic> announcements = data['data']['list'];

          // Jika ada pengumuman pertama dalam daftar
          if (announcements.isNotEmpty) {
            // Ambil pengumuman pertama
            Map<String, dynamic> firstAnnouncement = announcements[0];

            // Akses properti "title", "description", dan "created_at"
            setState(() {
              title = firstAnnouncement['title'];
              description = firstAnnouncement['description'];
              created_at = firstAnnouncement['created_at'];
            });
          } else {
            throw Exception('No announcements found');
          }
        } else {
          throw Exception('Missing expected data fields');
        }
      } else {
        throw Exception('Failed to load data from API: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error gracefully, such as showing an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = Get.arguments;

    // Container Card
    return Container(
      width: 382.w,
      padding: EdgeInsets.all(12.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 15,
            offset: Offset(4, 5),
            spreadRadius: 0,
          )
        ],
      ),

      // Container Column
      child: Column(
        children: [
          // Container Column Title, date, kategori
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: const Color(0xFFB5B7C4), width: 1.w),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                // Padding(
                //   padding: EdgeInsets.only(bottom: 15.w),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(6),
                //     child: Image.network(photo_url),
                //   ),
                // ),

                // Title
                Text(
                  title,
                  style: NunitoTextStyle.fw800.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 18.sp,
                  ),
                ),

                8.verticalSpace,

                // Row
                Row(
                  children: [
                    // Date Detail
                    Text(
                      created_at,
                      style: NunitoTextStyle.fw400.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 12.sp,
                      ),
                    ),
                    // Divider
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        '|',
                        style: NunitoTextStyle.fw400.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 10.sp,
                        ),
                      ),
                    ),

                    Text(
                      title,
                      style: NunitoTextStyle.fw500.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // Container Column Head, Content
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                1.verticalSpace,

                // Content
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: NunitoTextStyle.fw400.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),

          24.verticalSpace,

          // Footer Pengumuman
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Color(0xffB5B7C4)),
              ),
            ),
            child: Row(
              children: [
                // Text
                Text(
                  'Warga yang telah membaca',
                  style: NunitoTextStyle.fw400.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 11.sp,
                  ),
                ),

                Expanded(
                  child: Container(),
                ),

                // Profil
                buildImagesStack(),

                4.horizontalSpace,

                // Text
                Text(
                  '+${(controller.jumlahBaca.length) - (controller.imageUrls.length)}',
                  style: NunitoTextStyle.fw800.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 10.sp,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImagesStack() {
    // List berisi posisi kiri dari setiap gambar
    List<double> positions = [0, 12, 24, 36];

    return SizedBox(
      width: 56.w,
      height: 20.w,
      child: Obx(
        () => Stack(
          children: List.generate(controller.imageUrls.length, (index) {
            return Positioned(
              left: positions[index].w,
              child: Container(
                width: 20.w,
                height: 20.w,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/udeng.jpeg'),
                    fit: BoxFit.fill,
                  ),
                  shape: const OvalBorder(
                    side: BorderSide(width: 1, color: Color(0xFF6454F0)),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
