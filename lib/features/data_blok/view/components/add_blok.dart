import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/view/components/admin_informasi_bottomsheet.dart';
import 'package:venturo_core/features/admin_informasi/view/components/top_bar_add_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/button_gradient_admin.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_add_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/upload_gambar_admin.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';
import 'package:venturo_core/features/data_blok/view/components/data_blok_bottomsheet.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/laporan_pembayaran_bottomsheet.dart';
import 'package:venturo_core/features/pembayaran/view/components/upload_gambar.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class AddBlok extends StatefulWidget {
  @override
  _AddBlokState createState() => _AddBlokState();
}

class _AddBlokState extends State<AddBlok> {
  final TextEditingController contentController = TextEditingController();
  String? selectedBlok;
  List<String> blokList = []; // List untuk menyimpan data dari API

  @override
  void initState() {
    super.initState();
    // Panggil fungsi untuk mengambil data dari API saat widget diinisialisasi
    getDataBlok();
  }

  Future<void> getDataBlok() async {
    final response =
        await get(Uri.parse('http://rtonline-api.venturo.pro/api/v1/blocks'));
    if (response.statusCode == 200) {
      // Parse JSON response
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData.containsKey('data')) {
        final Map<String, dynamic> data = responseData['data'];
        if (data.containsKey('list')) {
          final List<dynamic> blokData = data['list'];
          setState(() {
            blokList = blokData.map((item) => item['name'].toString()).toList();
          });
        } else {
          throw Exception('Data does not contain list of blocks');
        }
      } else {
        throw Exception('Response does not contain data');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBarAdminInformasi(
              title: "Tambah Data Rumah",
            ),
            30.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 350.0),
              child: Text(
                "Blok",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            5.verticalSpace,
            Row(
              children: [
                14.horizontalSpace,
                Container(
                    width: 320,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButtonFormField(
                      value: selectedBlok,
                      items: blokList.map((String blok) {
                        return DropdownMenuItem<String>(
                          value: blok,
                          child: Text(blok),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBlok = newValue;
                        });
                      },
                      onTap: () {
                        // Panggil fetchData() ketika dropdown ditekan
                        getDataBlok();
                      },
                      decoration: InputDecoration(
                        hintText: 'Pilih Blok',
                        border: InputBorder.none,
                      ),
                    )),
                10.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: false,
                      context: context,
                      builder: (BuildContext context) {
                        return const DataBlokBottomsheet();
                      },
                    );
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF6EE2F5),
                          Color(0xFF6454F0),
                        ], // Ganti dengan warna sesuai keinginan
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            25.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 280.0),
              child: Text(
                "Nomor Rumah",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            5.verticalSpace,
            Container(
              width: 380,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
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
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Masukkan No. Rumah',
                  hintStyle: NunitoTextStyle.fw400,
                  border: InputBorder.none,
                ),
              ),
            ),
            500.verticalSpace,
            ButtonGradientAdmin(
              onPressed: () {
                Get.back(); // Kembali ke halaman sebelumnya setelah menambahkan
              },
            )
          ],
        ),
      ),
    );
  }
}
