import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TatibContentTiga extends StatelessWidget {
  const TatibContentTiga({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
      width: 334.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Teks nomor 1
          Text(
            "1. HAK WARGA",
            textAlign: TextAlign.left,
            style: NunitoTextStyle.fw400.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 14.sp,
            ),
          ),
          // List menggunakan bullet point dibawah teks HAK WARGA
          buildBulletPoint(
            "Setiap warga berhak mengeluarkan pendapat baik lisan maupun tulisan untuk disampaikan kepada pengurus RT 58.",
          ),
          buildBulletPoint(
            "Setiap warga berhak mengikuti setiap kegiatan yang diadakan di lingkungan RT 58.",
          ),
          buildBulletPoint(
            "Setiap warga berhak memilih dan dipilih sebagai ketua RT maupun pengurus RT 58.",
          ),
          buildBulletPoint(
            "Setiap warga berhak mengetahui laporan keuangan dan kas RT 58 secara proposional.",
          ),
          buildBulletPoint(
            "Setiap warga berhak mendapatkan perlindungan keamanan, ketentraman, dan kebersihan lingkungan yang diwujudkan secara bersama-sama dalam satu kesatuan rukun tetangga.",
          ),
          buildBulletPoint(
            "Setiap warga berhak meminjam inventaris yang dimiliki RT untuk keperluan hajatan keluarga.",
          ),
          buildBulletPoint(
            "Setiap warga berhak mendapatkan keamanan dan perlindungan dalam menjalankan ibadah keagamaan sesuai dengan kepercayaannya.",
          ),
        ],
      ),
    );
  }

  Widget buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(width: 8.w), // Tambahkan spasi di sini
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: NunitoTextStyle.fw400.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
