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
import 'package:venturo_core/features/detail_pemasukan/view/components/top_bar_pemasukan.dart';
import 'package:venturo_core/features/uang_keluar/controllers/uang_keluar_controller.dart';
import 'package:venturo_core/features/uang_keluar/view/components/detail_pemasukan_uang_masuk.dart';
import 'package:venturo_core/features/uang_keluar/view/components/filter_tanggal_uang_keluar.dart';
import 'package:venturo_core/features/uang_keluar/view/components/header_uang_keluar.dart';
import 'package:venturo_core/features/uang_masuk/controllers/uang_masuk_controller.dart';
import 'package:venturo_core/features/uang_masuk/view/components/detail_pemasukan_uang_masuk.dart';
import 'package:venturo_core/features/uang_masuk/view/components/header_uang_masuk.dart';
import 'package:venturo_core/features/uang_masuk/view/components/top_bar_pemasukan.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class UangKeluarScreen extends StatefulWidget {
  UangKeluarScreen({Key? key}) : super(key: key);

  @override
  _UangKeluarScreenState createState() => _UangKeluarScreenState();
}

class _UangKeluarScreenState extends State<UangKeluarScreen> {
  bool isSwitched = false;
  final UangKeluarController uangkeluarController =
      Get.put(UangKeluarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F5),
      body: Column(
        children: [
          // Topbar
          const HeaderUangKeluar(text: "Uang Keluar"),

          20.verticalSpace,
          FilterTanggalUangKeluar(),
          Divider(),

          Expanded(
            child:
                //BLOK A
                GestureDetector(
              onTap: () {
                Get.to(DetailPemasukanUangKeluarScreen());
              },
              child: Obx(
                () => ListView.builder(
                  itemCount: uangkeluarController.uangkeluarList.length,
                  itemBuilder: (context, index) {
                    final uangkeluar =
                        uangkeluarController.uangkeluarList[index];
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
                          uangkeluarController.removeUangkeluar(index);
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
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Transform.translate(
                                offset: Offset(50, 0),
                                child: Text(
                                  uangkeluar.date,
                                  style: NunitoTextStyle.fw700.copyWith(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 100, 84, 240)),
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(85, 0),
                                child: Transform.scale(
                                  scaleX: 2,
                                  child: Container(
                                    width: 178,
                                    height: 1,
                                    color:
                                        const Color.fromARGB(255, 66, 66, 66),
                                  ),
                                ),
                              ),
                              10.verticalSpace,
                              Text(
                                uangkeluar.title ?? 'Default Title',
                                style: NunitoTextStyle.fw700
                                    .copyWith(fontSize: 18),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(uangkeluar.content,
                                  style: NunitoTextStyle.fw600
                                      .copyWith(fontSize: 16)),
                              Text('Banyak  :  ' + uangkeluar.qty,
                                  style: NunitoTextStyle.fw600
                                      .copyWith(fontSize: 16)),
                              Text('Total      :  ' + uangkeluar.total,
                                  style: NunitoTextStyle.fw600
                                      .copyWith(fontSize: 16)),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Transform.translate(
                                offset: Offset(18, -5),
                                child: Text(uangkeluar.total,
                                    style: NunitoTextStyle.fw700.copyWith(
                                        fontSize: 18, color: Colors.black)),
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
        ],
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
