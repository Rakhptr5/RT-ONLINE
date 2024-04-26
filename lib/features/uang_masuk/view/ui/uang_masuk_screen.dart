import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/view/components/add_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/components/header_admin_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/components/search_bar_admin.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/add_pengumuman.dart';

import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_admin_pengumuman.dart';
import 'package:venturo_core/features/beranda/view/components/top_bar_preview_kas.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';
import 'package:venturo_core/features/data_blok/view/components/header_data_blok.dart';
import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';
import 'package:venturo_core/features/data_warga/view/components/header_data_warga.dart';
import 'package:venturo_core/features/data_warga/view/components/search_bar_data_warga.dart';
import 'package:venturo_core/features/uang_masuk/controllers/uang_masuk_controller.dart';
import 'package:venturo_core/features/uang_masuk/view/components/detail_pemasukan_uang_masuk.dart';
import 'package:venturo_core/features/uang_masuk/view/components/header_uang_masuk.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class UangMasukScreen extends StatefulWidget {
  UangMasukScreen({Key? key}) : super(key: key);

  @override
  _UangMasukScreenState createState() => _UangMasukScreenState();
}

class _UangMasukScreenState extends State<UangMasukScreen> {
  bool isSwitched = false;
  final UangMasukController uangmasukController =
      Get.put(UangMasukController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFEFF0F5),
        body: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 135.w,
                ),
                // Topbar
                const HeaderUangMasuk(text: "Uang Masuk"),

                // Search Bar
                const Positioned(
                    bottom: 0,
                    child: TopBarPreviewKas(
                      text: 'Oktober',
                    )),
              ],
            ),
            24.verticalSpace,
            SizedBox(
              width: 382.w,
              child: Obx(
                () => TabBar(
                  dividerColor: Colors.grey,
                  indicatorWeight: 2.w,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: const Color(0xFF6454F0),
                  onTap: (x) {
                    DataWargaController.to.currentIndex.value = x;
                  },
                  tabs: <Widget>[
                    Tab(
                      child: buildTab(text: "Iuran", index: 0),
                    ),
                    Tab(
                      child: buildTab(text: "Lain-lain", index: 1),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                //BLOK A
                GestureDetector(
                  onTap: () {
                    Get.to(DetailPemasukanUangMasukScreen());
                  },
                  child: Transform.translate(
                    offset: Offset(0, -40),
                    child: Obx(
                      () => ListView.builder(
                        itemCount: uangmasukController.uangmasukList.length,
                        itemBuilder: (context, index) {
                          final uangmasuk =
                              uangmasukController.uangmasukList[index];
                          return Dismissible(
                            background: Container(
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              decoration: ShapeDecoration(
                                  color: Color(0xFFD40202),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                            key: ValueKey(index),
                            onDismissed: (DismissDirection direction) {
                              setState(() {
                                uangmasukController.removeUangmasuk(index);
                              });
                            },
                            direction: DismissDirection.endToStart,
                            child: Container(
                              decoration: ShapeDecoration(
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x19000000),
                                      blurRadius: 8,
                                      offset: Offset(4, 3),
                                      spreadRadius: 0,
                                    )
                                  ],
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              margin: EdgeInsets.all(8.0),
                              padding: EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(1.w),
                                      width: 59.w,
                                      height: 67.w,
                                      child: Container(
                                        width: 25.w,
                                        height: 55.w,
                                        decoration: ShapeDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Que.jpeg'),
                                                fit: BoxFit.cover),
                                            shape: OvalBorder()),
                                      ),
                                    ),
                                    Positioned(
                                      top: 36.w,
                                      child: Container(
                                        width: 40.w,
                                        height: 20.w,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFF094181),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'C-2',
                                            style:
                                                NunitoTextStyle.fw700.copyWith(
                                              color: const Color(0xFFE2DDFE),
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  uangmasuk.category ?? 'Default Title',
                                  style: NunitoTextStyle.fw700
                                      .copyWith(fontSize: 18),
                                ),
                                subtitle: Text(uangmasuk.content,
                                    style: NunitoTextStyle.fw600
                                        .copyWith(fontSize: 16)),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Transform.translate(
                                      offset: Offset(18, 0),
                                      child: Text(uangmasuk.nominal,
                                          style: NunitoTextStyle.fw800.copyWith(
                                              fontSize: 23,
                                              color: Colors.black)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                //BLOK B
                GestureDetector(
                  onTap: () {
                    Get.to(DetailPemasukanUangMasukScreen());
                  },
                  child: Transform.translate(
                    offset: Offset(0, -40),
                    child: Obx(
                      () => ListView.builder(
                        itemCount: uangmasukController.uangmasukList.length,
                        itemBuilder: (context, index) {
                          final uangmasuk =
                              uangmasukController.uangmasukList[index];
                          return Dismissible(
                            background: Container(
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              decoration: ShapeDecoration(
                                  color: Color(0xFFD40202),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                            key: ValueKey(index),
                            onDismissed: (DismissDirection direction) {
                              setState(() {
                                uangmasukController.removeUangmasuk(index);
                              });
                            },
                            direction: DismissDirection.endToStart,
                            child: Container(
                              decoration: ShapeDecoration(
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x19000000),
                                      blurRadius: 8,
                                      offset: Offset(4, 3),
                                      spreadRadius: 0,
                                    )
                                  ],
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              margin: EdgeInsets.all(8.0),
                              padding: EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(1.w),
                                      width: 59.w,
                                      height: 67.w,
                                      child: Container(
                                        width: 25.w,
                                        height: 55.w,
                                        decoration: ShapeDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Que.jpeg'),
                                                fit: BoxFit.cover),
                                            shape: OvalBorder()),
                                      ),
                                    ),
                                    Positioned(
                                      top: 36.w,
                                      child: Container(
                                        width: 40.w,
                                        height: 20.w,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFF094181),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'C-3',
                                            style:
                                                NunitoTextStyle.fw700.copyWith(
                                              color: const Color(0xFFE2DDFE),
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  uangmasuk.category ?? 'Default Title',
                                  style: NunitoTextStyle.fw700
                                      .copyWith(fontSize: 18),
                                ),
                                subtitle: Text(uangmasuk.content,
                                    style: NunitoTextStyle.fw600
                                        .copyWith(fontSize: 16)),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Transform.translate(
                                      offset: Offset(18, 0),
                                      child: Text(uangmasuk.nominal,
                                          style: NunitoTextStyle.fw800.copyWith(
                                              fontSize: 23,
                                              color: Colors.black)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
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
          color: (DataWargaController.to.currentIndex.value == index)
              ? const Color(0xFF6454F0)
              : Colors.grey,
          fontSize: 16.sp,
        ),
      ),
    ],
  );
}
