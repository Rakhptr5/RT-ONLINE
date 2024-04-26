import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:venturo_core/features/beranda/models/pengumuman_model.dart';
import 'package:venturo_core/features/pengumuman_banner/controllers/detail_banner_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:venturo_core/features/pengumuman_banner/view/components/topbar_pengumuman.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DetailPengumumanScreenn extends StatefulWidget {
  final Pengumumann pengumuman;

  const DetailPengumumanScreenn({Key? key, required this.pengumuman})
      : super(key: key);

  @override
  _DetailPengumumanScreennState createState() =>
      _DetailPengumumanScreennState();
}

class _DetailPengumumanScreennState extends State<DetailPengumumanScreenn> {
  late DetailBannerController controller;
  late Future<List<String>> _fetchImageUrlsFuture;

  @override
  void initState() {
    super.initState();
    controller = Get.put(DetailBannerController());
    _fetchImageUrlsFuture = fetchImageUrls();
  }

  Future<List<String>> fetchImageUrls() async {
    try {
      final response = await http
          .get(Uri.parse('https://rtonline-api.venturo.pro/api/v1/citizen'));

      print(
          'Response body: ${response.body}'); // Tambahkan ini untuk mencetak respons API

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data['data'] != null && data['data']['list'] != null) {
          List<String> imageUrls = List<String>.from(
              data['data']['list'].map((item) => item['photo_url'].toString()));
          return imageUrls;
        } else {
          throw Exception('Invalid response format: missing "list" property');
        }
      } else {
        throw Exception('Failed to load image URLs');
      }
    } catch (e) {
      print('Error fetching image URLs: $e');
      rethrow;
    }
  }

  Future<List<String>> fetchProfileImageUrls() async {
    try {
      final response = await http
          .get(Uri.parse('https://rtonline-api.venturo.pro/api/v1/viewers'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        // Mendapatkan daftar URL gambar profil
        List<dynamic>? profilePhotos = data['citizen_photos'];

        // Jika daftar tidak null, maka konversi ke List<String>
        if (profilePhotos != null) {
          List<String> profileImageUrls = profilePhotos
              .map((profilePhoto) => profilePhoto.toString())
              .toList();
          return profileImageUrls;
        } else {
          // Jika daftar null, kembalikan gambar default dari assets
          return ['assets/images/udeng.jpeg'];
        }
      } else {
        throw Exception('Failed to load profile image URLs');
      }
    } catch (e) {
      print('Error fetching profile image URLs: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBarPengumuman(title: "Pengumuman"),
            30.verticalSpace,
            Center(
              child: Container(
                width: 380,
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 8,
                        offset: Offset(4, 3),
                        spreadRadius: 0,
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (widget.pengumuman.photo_url != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotoViewerPages(
                                imageUrl: widget.pengumuman.photo_url!,
                              ),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 17.0, bottom: 14.0, right: 18, left: 18),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            widget.pengumuman.photo_url ?? '',
                            height: 160,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 160,
                                width: double.infinity,
                                color: Colors.white,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.pengumuman.title,
                            style: NunitoTextStyle.fw700.copyWith(fontSize: 18),
                          ),
                          5.verticalSpace,
                          Row(
                            children: [
                              Text(
                                widget.pengumuman.created_at,
                                style: NunitoTextStyle.fw600
                                    .copyWith(fontSize: 14),
                              ),
                              8.horizontalSpace,
                              Container(
                                width: 1,
                                height: 13,
                                color: Colors.black,
                              ),
                              8.horizontalSpace,
                              Text(
                                widget.pengumuman.title,
                                style: NunitoTextStyle.fw600
                                    .copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                          Divider(
                            color: Color.fromARGB(255, 157, 157, 157),
                          ),
                          15.verticalSpace,
                          Text(
                            widget.pengumuman.description,
                            style: NunitoTextStyle.fw600.copyWith(fontSize: 16),
                          ),
                          15.verticalSpace,
                          Divider(
                            color: Color.fromARGB(255, 157, 157, 157),
                          ),
                          Row(
                            children: [
                              // Text
                              Text(
                                'Warga yang telah membaca',
                                style: NunitoTextStyle.fw400.copyWith(
                                  color: const Color(0xFF0B0C0D),
                                  fontSize: 14.sp,
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                child: FutureBuilder<List<String>>(
                                    future: fetchProfileImageUrls(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasError) {
                                        return Text(
                                            'Error fetching profile image URLs: ${snapshot.error}');
                                      } else {
                                        List<String> profileImageUrls =
                                            snapshot.data ?? [];

                                        return Stack(
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              height: 40,
                                              child: Stack(
                                                children: List.generate(
                                                    profileImageUrls.length,
                                                    (index) {
                                                  return Positioned(
                                                    left: index * 12.w,
                                                    child: Container(
                                                      width: 25.w,
                                                      height: 25.w,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            width: 1,
                                                            color: Color(
                                                                0xFF6454F0)),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/udeng.jpeg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),
                                            Positioned(
                                              right: 11,
                                              child: Obx(
                                                () => Container(
                                                  width: 25.w,
                                                  height: 25.w,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF6454F0),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 1,
                                                        color:
                                                            Color(0xFF6454F0)),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '+${(controller.jumlahBaca.length) - profileImageUrls.length}',
                                                      style: NunitoTextStyle
                                                          .fw800
                                                          .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 11.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                    }),
                              ),
                              // Profil

                              4.horizontalSpace,
                              // Text
                            ],
                          ),
                          10.verticalSpace
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PhotoViewerPages extends StatelessWidget {
  final String imageUrl;

  const PhotoViewerPages({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(imageUrl),
          backgroundDecoration: BoxDecoration(
            color: Colors.black,
          ),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2.0,
        ),
      ),
    );
  }
}
