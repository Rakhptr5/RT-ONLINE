// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/button_gradient_admin.dart';

import 'package:venturo_core/features/data_warga/constants/data_warga_assets_constant.dart';
import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_card.dart';
import 'package:venturo_core/features/data_warga/view/components/header_data_warga.dart';
import 'package:venturo_core/features/data_warga/view/components/search_bar_data_warga.dart';
import 'package:venturo_core/features/hak_akses/controllers/hak_akses_controller.dart';
import 'package:venturo_core/features/hak_akses/repositories/hak_akses_repository.dart';
import 'package:venturo_core/features/hak_akses/view/components/hak_akses_card.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/terbayar_belumterbayar.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/top_bar_preview_kas.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

import '../../../beranda/view/components/header_beranda.dart';
import '../../../beranda/view/components/top_bar_preview_kas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/hak_akses/controllers/hak_akses_controller.dart';
import 'package:venturo_core/features/hak_akses/view/components/hak_akses_card.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

import '../../../beranda/view/components/header_beranda.dart';

class AddHakAksesPage extends StatefulWidget {
  AddHakAksesPage({Key? key}) : super(key: key);

  @override
  _AddHakAksesPageState createState() => _AddHakAksesPageState();
}

class _AddHakAksesPageState extends State<AddHakAksesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<CheckList> hakAkses = [];
  HakAksesRepository repository = HakAksesRepository();
  String name = '';
  List<String> selectedAccess = [];
  final TextEditingController _nameController = TextEditingController();
  List<bool> dataWargaChecked = [];
  List<bool> informasiChecked = [];
  List<bool> pengumumanChecked = [];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    dataWargaChecked = List.generate(dataWarga.length, (index) => false);
    informasiChecked = List.generate(informasi.length, (index) => false);
    pengumumanChecked = List.generate(pengumuman.length, (index) => false);
  }

  List<CheckList> dataWarga = [
    CheckList(akses: 'Data Warga'),
    CheckList(akses: 'Undang Warga')
  ];

  List<CheckList> informasi = [CheckList(akses: 'Menambah informasi')];

  List<CheckList> pengumuman = [CheckList(akses: 'Menambah pengumuman')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(15).w)),
          title: Text(
            'Tambah Hak Akses',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(20),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          primary: true,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.90, -0.44),
                  end: Alignment(-0.9, 0.44),
                  colors: [Color(0xFF6EE2F5), Color(0xFF6454F0)],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15).r)),
          ),
          leading: IconButton(
            padding: EdgeInsets.only(left: 30).r,
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 23,
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Color(0xFFEFF0F5),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(children: <Widget>[
            Container(
                width: ScreenUtil().setWidth(360),
                height: ScreenUtil().setHeight(89),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: ScreenUtil().setWidth(2),
                        color: Color(0xFFEFF0F5)),
                  ),
                ),
                margin: EdgeInsets.only(top: 25).r,
                child: Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ' Nama Hak Akses',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Color(0xFF0B0C0D),
                          fontSize: ScreenUtil().setSp(13),
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Container(
                    width: ScreenUtil().setWidth(382),
                    height: ScreenUtil().setHeight(35),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6).w),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 8,
                          offset: Offset(4, 3),
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: TextField(
                      controller: _nameController,
                      onChanged: (value) {
                        name = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Masukkan Nama Hak Akses',
                        hintStyle: TextStyle(
                            color: Color(0xFF9597A3),
                            fontSize: ScreenUtil().setSp(13),
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700),
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ])),
            Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 20).r,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.grey,
                            width: ScreenUtil().setWidth(2)))),
                child: Column(children: [
                  TabBar(
                      dividerColor: Colors.grey,
                      controller: _tabController,
                      labelColor:
                          Color(0xFF6454F0), // Warna teks pada tab aktif
                      labelStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700),
                      unselectedLabelColor: Color(0xFF9597A3),
                      tabs: [
                        Tab(text: 'Data Warga'),
                        Tab(text: 'Informasi'),
                        Tab(
                          child: Wrap(children: [
                            Text(
                              'Pengumuman & Banner',
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        )
                      ]),
                ])),
            SizedBox(height: ScreenUtil().setHeight(10)),
            SizedBox(
              height: MediaQuery.of(context).size.height - 400.h,
              child: TabBarView(controller: _tabController, children: [
                SizedBox(
                  child: Container(
                    child: ListView.builder(
                        padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 25),
                        itemCount: dataWarga.length,
                        itemBuilder: (context, index) {
                          return CheckList(
                            akses: dataWarga[index].akses,
                            isChecked: dataWargaChecked[index],
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  selectedAccess.add(dataWarga[index].akses);
                                } else {
                                  selectedAccess.removeWhere(
                                      (item) => item == dataWarga[index].akses);
                                }
                              }
                            },
                          );
                        }),
                  ),
                ),
                SizedBox(
                    child: Container(
                  child: ListView.builder(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 25),
                      itemCount: informasi.length,
                      itemBuilder: (context, index) {
                        return CheckList(
                          akses: informasi[index].akses,
                          isChecked: dataWargaChecked[index],
                          onChanged: (value) {
                            if (value != null) {
                              if (value) {
                                selectedAccess.add(informasi[index].akses);
                              } else {
                                selectedAccess.removeWhere(
                                    (item) => item == informasi[index].akses);
                              }
                            }
                          },
                        );
                      }),
                )),
                SizedBox(
                    child: Container(
                  child: ListView.builder(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 25),
                      itemCount: pengumuman.length,
                      itemBuilder: (context, index) {
                        return CheckList(
                          akses: pengumuman[index].akses,
                          isChecked: dataWargaChecked[index],
                          onChanged: (value) {
                            if (value != null) {
                              if (value) {
                                selectedAccess.add(pengumuman[index].akses);
                              } else {
                                selectedAccess.removeWhere(
                                    (item) => item == pengumuman[index].akses);
                              }
                            }
                          },
                        );
                      }),
                ))
              ]),
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  Map<String, dynamic> response =
                      await postHak(name, selectedAccess);
                  print(response);
                  if (response.containsKey('error')) {
                  } else {
                    Get.back();
                  }
                },
                child: Container(
                  width: ScreenUtil().setWidth(382),
                  height: ScreenUtil().setHeight(54),
                  // margin: EdgeInsets.only(bottom: 20, top: 100).r,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      end: Alignment(0.90, -0.44),
                      begin: Alignment(-0.9, 0.44),
                      colors: [Color(0xFF6EE2F5), Color(0xFF6454F0)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8).w,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Simpan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(16),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        )));
  }
}

class CheckList extends StatefulWidget {
  final String akses;
  final bool isChecked;
  final ValueChanged<bool?>? onChanged;

  const CheckList({
    required this.akses,
    this.isChecked = false,
    this.onChanged,
  });

  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(382),
        height: ScreenUtil().setHeight(48),
        margin: EdgeInsets.only(bottom: 15).r,
        padding: const EdgeInsets.all(12).w,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6).w),
            shadows: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 8,
                offset: Offset(4, 3),
                spreadRadius: 0,
              )
            ]),
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                  widget.onChanged?.call(value);
                });
              },
            ),
            Text(
              widget.akses,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xFF0B0C0D),
              ),
            ),
          ],
        ));
  }
}
