import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/beranda/controllers/pengumuman_controller.dart';
import 'package:venturo_core/features/beranda/models/pengumuman_model.dart';
import 'package:venturo_core/features/beranda/view/components/detail_pengumuman_screen.dart';
import 'package:venturo_core/features/beranda/view/components/pengumuman_content_beranda.dart';
import 'package:venturo_core/features/beranda/view/components/pengumuman_header_beranda.dart';
import 'package:venturo_core/features/pengumuman_banner/view/ui/detail_pengumuman_screen.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class PengumumanCardBeranda extends StatefulWidget {
  const PengumumanCardBeranda({
    Key? key,
  }) : super(key: key);

  @override
  _PengumumanCardBerandaState createState() => _PengumumanCardBerandaState();
}

class _PengumumanCardBerandaState extends State<PengumumanCardBeranda> {
  late PengumumanController _pengumumanController;
  late Future<List<Pengumumann>> pengumuman;

  @override
  void initState() {
    pengumuman = getPengumuman();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500, // Tetapkan tinggi yang tetap di sini
      width: 382.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(4, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Section
          const PengumumanHeaderBeranda(),

          // Divider
          const Divider(
            color: Color(0xffEFF0F5),
            thickness: 1,
          ),

          //Ini List mepetkan dengan divider diatas
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder<List<Pengumumann>>(
                future: pengumuman,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Tampilkan loading indicator jika future masih berjalan
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    // Tampilkan daftar kategori jika data sudah tersedia
                    return ListView.builder(
                      padding: EdgeInsets.all(0),
                      physics:
                          NeverScrollableScrollPhysics(), // Disable ListView scrolling
                      shrinkWrap: true, // Added to prevent constraints errors
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          // Di dalam itemBuilder ListView.builder
                          onTap: () {
                            // Navigasi ke halaman detail pengumuman menggunakan Get.to
                            Get.to(() => DetailPengumumanScreenn(
                                pengumuman: snapshot.data![index]));
                          },

                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        snapshot.data![index].title,
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: NunitoTextStyle.fw800
                                            .copyWith(fontSize: 18),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      //text tanggal
                                      snapshot.data![index].created_at,
                                      style: NunitoTextStyle.fw800
                                          .copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                                Text(
                                  snapshot.data![index].description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: NunitoTextStyle.fw600
                                      .copyWith(fontSize: 14),
                                ),
                                Divider()
                              ],
                            ),
                          ),
                        );
                      },
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
            ),
          ),
        ],
      ),
    );
  }
}
