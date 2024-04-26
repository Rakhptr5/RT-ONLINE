// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/beranda/models/pengumuman_model.dart';
import 'package:venturo_core/features/hak_akses/models/hak_akses_model.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class PengumumanContentBeranda extends StatefulWidget {
  PengumumanContentBeranda({
    Key? key,
    this.isPinned = false,
    this.isLast = false,
    // required this.image,
    required this.title,
    // required this.head,
    //required this.kategori,
    // required this.date,
    // required this.dateDetail,
    // required this.content,
    required this.onTap,
  }) : super(key: key);

  final bool isPinned;
  final bool isLast;
  //final String image;
  final String title;
//  final String head;
//  final String kategori;
  // final String date;
//  final String dateDetail;
//  final String content;
  final VoidCallback onTap;

  @override
  _PengumumanContentBerandaState createState() =>
      _PengumumanContentBerandaState();
}

class _PengumumanContentBerandaState extends State<PengumumanContentBeranda> {
  late Future<List<Pengumumann>> pengumuman;

  @override
  void initState() {
    pengumuman = getPengumuman();
  }

  void _navigateToDetailPage() {
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToDetailPage,
      child: Container(
        margin: (widget.isLast == false)
            ? EdgeInsets.symmetric(vertical: 7.5.w)
            : EdgeInsets.only(top: 7.5.w),
        width: 358.w,
        height: 116.w,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header and Pin Icon
              FutureBuilder<List<Pengumumann>>(
                future: pengumuman,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Tampilkan loading indicator jika future masih berjalan
                    return Padding(
                      padding: const EdgeInsets.only(top: 98.0),
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    // Tampilkan daftar kategori jika data sudah tersedia
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data![index].title,
                                      style: NunitoTextStyle.fw800
                                          .copyWith(fontSize: 19),
                                    ),
                                  ],
                                ),
                                Divider()
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // Tampilkan pesan kesalahan jika terjadi kesalahan
                    return Text('Terjadi kesalahan: ${snapshot.error}');
                  } else {
                    // Kasus lainnya (contoh: future belum dimulai)
                    return Text('Menunggu...');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
