import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:venturo_core/features/edit_general/view/ui/edit_general_screen.dart';
import 'package:venturo_core/features/general/models/citizen.dart';
import 'dart:convert';

import 'package:venturo_core/features/general/models/generales.dart';
import 'package:venturo_core/features/general/view/components/textfield_general.dart';
import 'package:venturo_core/features/general/view/components/top_bar_general.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/laporan_pembayaran_bottomsheet.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  late Future<General> _futureGeneral;
  late Future<List<Citizen>> _futureCitizens;
  @override
  void initState() {
    super.initState();
    _futureGeneral = fetchGeneralData();
  }

  void initState2() {
    super.initState();
    _futureCitizens = fetchCitizens();
  }

  Future<List<Citizen>> fetchCitizens() async {
    final response = await http.get(
      Uri.parse(
          'http://rtonline-api.venturo.pro/api/v1/citizen?sort=id%20DESC&page=1'),
    );

    if (response.statusCode == 200) {
      final parsedData = jsonDecode(response.body);
      final List<dynamic> citizensJson = parsedData['data']['list'];
      final List<Citizen> citizens =
          citizensJson.map((json) => Citizen.fromJson(json)).toList();
      return citizens;
    } else {
      throw Exception('Gagal memuat data warga');
    }
  }

  Future<General> fetchGeneralData() async {
    final response = await http.get(
      Uri.parse(
          'http://rtonline-api.venturo.pro/api/v1/residence?sort=id%20DESC&page=1'),
    );

    if (response.statusCode == 200) {
      final parsedData = jsonDecode(response.body);
      if (parsedData != null && parsedData['data'] != null) {
        final generalData = General.fromJson(parsedData['data']);
        return generalData;
      } else {
        throw Exception('Data JSON tidak sesuai format yang diharapkan');
      }
    } else {
      throw Exception('Gagal memuat data umum');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _refreshData(),
        child: FutureBuilder<General>(
          future: _futureGeneral,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBarGeneral(
                    title: 'General',
                  ),
                  Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final generalData = snapshot.data!;
              final getData = generalData.list[0];
              if (getData != null) {
                return SingleChildScrollView(
                  physics:
                      AlwaysScrollableScrollPhysics(), // Enable scrolling even when there is not enough content
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 1.sw,
                        height: 100.w,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF6EE2F5),
                              Color(0xFF6454F0),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1E000000),
                              blurRadius: 18,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),

                        // TopBar Tata Tertib
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15.w),
                              width: 1.sw,
                              height: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Button Back Icons
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    child: SizedBox(
                                      width: 40.w,
                                      height: 40.w,
                                      child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: const ImageIcon(
                                          AssetImage(
                                              "assets/images/ic_arrow_ios_left.png"),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Text Informasi
                                  Text(
                                    'General',
                                    textAlign: TextAlign.center,
                                    style: PoppinsTextStyle.fw600.copyWith(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.to(EditGeneralScreen());
                                    },
                                    icon: const ImageIcon(
                                      AssetImage("assets/images/edit.png"),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.verticalSpace,
                            Text(
                              "Informasi Perumahan",
                              style:
                                  PoppinsTextStyle.fw600.copyWith(fontSize: 20),
                            ),
                            17.verticalSpace,
                            TextFieldGeneral(
                              label: 'RT',
                              desc: getData.rt.toString(),
                            ),
                            15.verticalSpace,
                            TextFieldGeneral(
                                label: 'RW', desc: getData.rw.toString()),
                            15.verticalSpace,
                            TextFieldGeneral(
                                label: 'Alamat',
                                desc: getData.address.toString()),
                            15.verticalSpace,
                            TextFieldGeneral(
                                label: 'Provinsi',
                                desc: getData.province.toString()),
                            15.verticalSpace,
                            TextFieldGeneral(
                                label: 'Kota/Kabupaten',
                                desc: getData.city.toString()),
                            15.verticalSpace,
                            TextFieldGeneral(
                                label: 'Kecamatan',
                                desc: getData.district.toString()),
                            15.verticalSpace,

                            TextFieldGeneral(
                                label: 'Kode Pos',
                                desc: getData.postCode.toString()),
                            15.verticalSpace,
                            TextFieldGeneral(
                                label: 'Penanggung Jawab',
                                desc: getData.responsiblePerson.toString()),
                            15.verticalSpace,
                            TextFieldGeneral(
                                label: 'No. Handphone',
                                desc: getData.phoneNumber.toString()),
                            20.verticalSpace,

                            // Tampilkan struktur
                            Text(
                              "Struktur RT",
                              style:
                                  PoppinsTextStyle.fw600.copyWith(fontSize: 20),
                            ),
                            20.verticalSpace,
                            SizedBox(
                              height:
                                  290, // Sesuaikan dengan tinggi yang diinginkan
                              child: ListView.builder(
                                padding: EdgeInsets.only(top: 2),
                                itemCount: generalData.list.length,
                                itemBuilder: (context, index) {
                                  final structure =
                                      generalData.list[index].structure;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: structure.map((item) {
                                      return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextFieldGeneral(
                                                label: 'Nama',
                                                desc: item.citizenId),
                                            15.verticalSpace,
                                            TextFieldGeneral(
                                                label: 'Jabatan',
                                                desc: item.position),
                                            28.verticalSpace,
                                          ]);
                                    }).toList(),
                                  );
                                },
                              ),
                            ),
                            20.verticalSpace,
                            // Tampilkan list akun bank
                            Text(
                              "List Akun Bank",
                              style:
                                  PoppinsTextStyle.fw600.copyWith(fontSize: 20),
                            ),
                            20.verticalSpace,
                            SizedBox(
                              height:
                                  220, // Sesuaikan dengan tinggi yang diinginkan
                              child: ListView.builder(
                                padding: EdgeInsets.only(top: 2),
                                itemCount: generalData.list.length,
                                itemBuilder: (context, index) {
                                  final bank = generalData.list[index].bank;
                                  return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFieldGeneral(
                                            label: 'Nama Bank',
                                            desc: bank.name),
                                        15.verticalSpace,
                                        TextFieldGeneral(
                                            label: 'No. Rekening',
                                            desc: bank.noRek),
                                        15.verticalSpace,
                                        TextFieldGeneral(
                                            label: 'Nama Pemilik Rekening',
                                            desc: bank.holderName),
                                        15.verticalSpace,
                                      ]);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Text("Tidak ada data kedua dalam list.");
              }
            }
          },
        ),
      ),
    );
  }

  Future<void> _refreshData() async {
    setState(() {
      _futureGeneral = fetchGeneralData();
    });
  }
}
