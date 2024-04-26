import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/data_warga/constants/data_warga_assets_constant.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

import '../../controllers/rincian_iuran_controller.dart';
import '../components/rincian_iuran_card.dart';
import '../../../beranda/view/components/header_beranda.dart';
import '../../../beranda/view/components/top_bar_preview_kas.dart';

class RincianIuranScreen extends StatefulWidget {
  RincianIuranScreen({Key? key}) : super(key: key);

  @override
  _RincianIuranScreenState createState() => _RincianIuranScreenState();
}

class _RincianIuranScreenState extends State<RincianIuranScreen> {
  final assetsConstant = DataWargaAssetsConstant();
  bool isChecked = false;
  // List A
  late List<RincianIuranCard> listDataWargaA;

  @override
  void initState() {
    super.initState();
    listDataWargaA = List<RincianIuranCard>.generate(
      6,
      (index) => const RincianIuranCard(
        profileName: "Januari",
        profileNumber: 'Rp 300.000',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: const Color(0xffeff0f5),
        body: Column(
          children: [
            // Stack
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 135.w,
                ),
                const HeaderBeranda(
                  text: "Pembayaran Warga",
                  prefixIcon: Icons.arrow_back_ios_new_rounded,
                ),
                130.verticalSpace,
                // Button
                const Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TopBarPreviewKas(
                      text: "2023",
                    ),
                  ),
                )
              ],
            ),
            5.verticalSpace,
            20.verticalSpace,
            Expanded(
              child: SizedBox(
                child: TabBarView(
                  children: <Widget>[
                    // Blok A
                    ListView.builder(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                      itemCount: listDataWargaA.length,
                      itemBuilder: (context, index) {
                        return RincianIuranCard(
                          profileName: listDataWargaA[index].profileName,
                          profileNumber: listDataWargaA[index].profileNumber,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 90,
          decoration: ShapeDecoration(
            color: Colors.white,
            shadows: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              8.horizontalSpace,
              InkWell(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        color: isChecked ? Color(0xFF6454F0) : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: isChecked
                            ? null
                            : Border.all(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                      ),
                      child: isChecked
                          ? Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18.w,
                              ),
                            )
                          : null,
                    ),
                  ],
                ),
              ),
              5.horizontalSpace,
              Text(
                "Bayar Semua",
                style: NunitoTextStyle.fw700.copyWith(fontSize: 13),
              ),
              14.horizontalSpace,
              Transform.translate(
                offset: Offset(0, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Total Pembayaran",
                      style: NunitoTextStyle.fw600.copyWith(fontSize: 16),
                    ),
                    Text(
                      "RP 300.000",
                      style: NunitoTextStyle.fw800.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ),
              10.horizontalSpace,
              Material(
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF6EE2F5),
                          Color(0xFF6454F0),
                        ], // Sesuaikan dengan warna yang diinginkan
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      width: 120.w,
                      height: 54.w,
                      padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 16)
                          .w,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Bayar (1)",
                          style: NunitoTextStyle.fw700.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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

Widget buildTab({
  required String text,
  required int index,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: NunitoTextStyle.fw700.copyWith(
          color: (RincianIuranController.to.currentIndex.value == index)
              ? const Color(0xFF6454F0)
              : Colors.grey,
          fontSize: 16.sp,
        ),
      ),
    ],
  );
}
