import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/view/components/add_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/components/admin_info_card.dart';
import 'package:venturo_core/features/admin_informasi/view/components/header_admin_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/components/search_bar_admin.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/add_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/button_gradient_admin.dart';

import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_admin_pengumuman.dart';
import 'package:venturo_core/features/data_warga/view/components/header_data_warga.dart';
import 'package:venturo_core/features/data_warga/view/components/search_bar_data_warga.dart';
import 'package:venturo_core/features/kategori_iuran/models/kategori_iuran_model.dart';
import 'package:venturo_core/features/kategori_iuran/view/components/add_kategori.dart';
import 'package:venturo_core/features/kategori_iuran/view/components/bottomsheet_iuran.dart';
import 'package:venturo_core/features/kategori_iuran/view/components/button_gradient_data_warga.dart';
import 'package:venturo_core/features/kategori_iuran/view/components/kategori_iuran_card2%20copy.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class KategoriIuranScreen extends StatefulWidget {
  @override
  _KategoriIuranScreenState createState() => _KategoriIuranScreenState();
}

class _KategoriIuranScreenState extends State<KategoriIuranScreen> {
  List<dynamic> duesData = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Pemanggilan fetchData hanya sekali saat initState dipanggil
  }

  Future<void> fetchData() async {
    var apiUrl = 'https://rtonline-api.venturo.pro/api/v1/dues';
    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      setState(() {
        duesData = responseData['data']['list'];
      });
    } else {
      print('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 240, 245),
      body: Column(
        children: [
          const HeaderAdminInformasi(text: "Iuran"),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(top: 20),
              child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        padding: EdgeInsets.only(top: 0),
                        itemCount: duesData.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = duesData[index];
                          return Center(
                              child: Container(
                                  width: ScreenUtil().setWidth(382),
                                  child: Stack(children: [
                                    Container(
                                      width: ScreenUtil().setWidth(382),
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.only(top: 20),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 24,
                                              vertical: 14,
                                            ).w,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12).w,
                                              ),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x19000000),
                                                  blurRadius: 8,
                                                  offset: Offset(4, 3),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  margin:
                                                      EdgeInsets.only(top: 6),
                                                  decoration: ShapeDecoration(
                                                    shape: Border(
                                                      bottom: BorderSide(
                                                        width: ScreenUtil()
                                                            .setWidth(1),
                                                        color:
                                                            Color(0xFFB5B7C4),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      ListTile(
                                                        subtitle: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            ListView.builder(
                                                              padding: EdgeInsets
                                                                  .only(top: 3),
                                                              shrinkWrap: true,
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              itemCount:
                                                                  item['detail']
                                                                      .length,
                                                              itemBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      int i) {
                                                                var detailItem =
                                                                    item['detail']
                                                                        [i];
                                                                return Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            detailItem['name'] ??
                                                                                '',
                                                                            style:
                                                                                NunitoTextStyle.fw700.copyWith(
                                                                              color: Color(0xFF0B0C0D),
                                                                              fontSize: ScreenUtil().setSp(15),
                                                                            ),
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                            NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(detailItem['nominal']),
                                                                            style:
                                                                                NunitoTextStyle.fw700.copyWith(
                                                                              color: Color(0xFF0B0C0D),
                                                                              fontSize: ScreenUtil().setSp(15),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              ScreenUtil().setHeight(10)),
                                                                    ]);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: ScreenUtil()
                                                        .setHeight(15)),
                                                Container(
                                                  width: double.infinity,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                      'Total Iuran',
                                                                      style: NunitoTextStyle.fw800.copyWith(
                                                                          fontSize:
                                                                              20,
                                                                          color:
                                                                              Color(0xFF221A8B))),
                                                                  Spacer(),
                                                                  Text(
                                                                      NumberFormat.currency(
                                                                              locale:
                                                                                  'id_ID',
                                                                              symbol:
                                                                                  'Rp ',
                                                                              decimalDigits:
                                                                                  0)
                                                                          .format(item[
                                                                              'nominal_dues']),
                                                                      style: NunitoTextStyle.fw800.copyWith(
                                                                          fontSize:
                                                                              20,
                                                                          color:
                                                                              Color(0xFF221A8B))),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenUtil()
                                                              .setHeight(15)),
                                                      Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {},
                                                              child: Container(
                                                                height: 35,
                                                                width: 105,
                                                                decoration: ShapeDecoration(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            9,
                                                                            65,
                                                                            130),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5))),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Image.asset(
                                                                      'assets/images/edit.png',
                                                                      height:
                                                                          20,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    10.horizontalSpace,
                                                                    Text(
                                                                      "Edit Iuran",
                                                                      style: NunitoTextStyle.fw500.copyWith(
                                                                          fontSize: 12
                                                                              .sp,
                                                                          color:
                                                                              Colors.white),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: ScreenUtil()
                                                                    .setWidth(
                                                                        15)),
                                                            GestureDetector(
                                                              onTap: () {
                                                                showModalBottomSheet(
                                                                  backgroundColor:
                                                                      Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                  context:
                                                                      context,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              25),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              25),
                                                                    ),
                                                                  ),
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return SizedBox(
                                                                        height: ScreenUtil().setHeight(
                                                                            450),
                                                                        width: ScreenUtil().setWidth(
                                                                            420),
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Container(
                                                                              height: 6.0, // Sesuaikan tinggi handlebar sesuai kebutuhan
                                                                              width: 100.0, // Sesuaikan lebar handlebar sesuai kebutuhan
                                                                              decoration: BoxDecoration(
                                                                                color: Color.fromARGB(255, 49, 49, 49),
                                                                                borderRadius: BorderRadius.circular(3.0),
                                                                              ),
                                                                              margin: EdgeInsets.symmetric(vertical: 8.0),
                                                                            ),
                                                                            10.verticalSpace,
                                                                            Text(
                                                                              "Riwayat Edit",
                                                                              style: PoppinsTextStyle.fw600.copyWith(fontSize: 20),
                                                                            ),
                                                                            10.verticalSpace,
                                                                            Expanded(
                                                                              child: Container(
                                                                                  // Set the height as per your requirement
                                                                                  width: 420,
                                                                                  child: BottomSheetIuran()),
                                                                            )
                                                                          ],
                                                                        ));
                                                                  },
                                                                );
                                                              },
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/History.png',
                                                                height: 30,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Center(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 18,
                                                    vertical: 8,
                                                  ),
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFF6454F0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                                  12)
                                                              .w,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '20 Warga',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: ScreenUtil()
                                                              .setSp(16),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ])));
                        },
                      );
                    }
                  }),
            ),
          ),
          ButtonGradientKategori(
              text: "Tambah Kategori Iuran",
              onPressed: () {
                Get.to(AddKategoriPage());
              }),
          15.verticalSpace
        ],
      ),
    );
  }
}
