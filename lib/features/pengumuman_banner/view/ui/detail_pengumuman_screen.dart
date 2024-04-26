import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/pengumuman_banner/view/components/detail_pengumuman_card.dart';
import 'package:venturo_core/features/pengumuman_banner/view/components/topbar_pengumuman.dart';

class DetailPengumumanScreen extends StatefulWidget {
  const DetailPengumumanScreen({
    Key? key,
  }) : super(key: key);
  @override
  _DetailPengumumanScreenState createState() => _DetailPengumumanScreenState();
}

class _DetailPengumumanScreenState extends State<DetailPengumumanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Topbar
            const TopBarPengumuman(title: "Pengumuman"),

            SizedBox(height: 32.h),

            // Card
            DetailPengumumanCard(),
          ],
        ),
      ),
    );
  }
}
