import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'package:venturo_core/features/admin_pengumuman/view/components/button_gradient_admin.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_add_pengumuman.dart';

import 'package:venturo_core/features/kategori_iuran/controllers/kategori_iuran_controller.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

import 'package:http/http.dart' as http;

class AddKategoriPage extends StatefulWidget {
  @override
  _AddKategoriPageState createState() => _AddKategoriPageState();
}

class _AddKategoriPageState extends State<AddKategoriPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController jenisIuranController = TextEditingController();
  final TextEditingController nominalIuranController = TextEditingController();

  final KategoriIuranController kategoriController =
      Get.put(KategoriIuranController());

  Future<void> postData() async {
    // Constructing the request body
    final requestBody = jsonEncode({
      "detail": [
        {
          "name": "aku anis",
          "nominal": 60000,
        },
      ]
    });

    final response = await http.post(
      Uri.parse('https://rtonline-api.venturo.pro/api/v1/dues'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Check if the response content type is JSON
      final contentType = response.headers['content-type'];
      if (contentType != null && contentType.contains('application/json')) {
        // Decode the response body
        final responseData = jsonDecode(response.body);
        print('Data berhasil dipost: $responseData');
      } else {
        // Print the response body directly
        print('Data berhasil dipost: ${response.body}');
      }
    } else {
      print('Gagal memposting data: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBarAdminPengumuman2(
              title: "Kategori Iuran",
            ),

            30.verticalSpace,

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Jenis Iuran",
                    style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
                  ),
                ),
                280.horizontalSpace,
                Icon(
                  Icons.close_rounded,
                  size: 20,
                )
              ],
            ),
            5.verticalSpace,
            Container(
              width: 380,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
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
                controller: jenisIuranController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Jenis Iuran',
                  hintStyle: NunitoTextStyle.fw400,
                  border: InputBorder.none,
                ),
              ),
            ),
            25.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 315.0),
              child: Text(
                "Nominal",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            5.verticalSpace,

            //IURAN PERTAMA
            Container(
              width: 380.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 8,
                    offset: Offset(4, 3),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40, // Adjust the width as needed
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF094282),
                    ),
                    child: Center(
                      child: Text(
                        'Rp',
                        style: TextStyle(
                          fontFamily: 'NunitoBold',
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Spacer
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, bottom: 5),
                      child: TextField(
                        controller:
                            nominalIuranController, // Gunakan controller yang diterima dari luar
                        style: NunitoTextStyle.fw600.copyWith(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Divider(),

            //2

            // Tambahkan input untuk upload gambar jika diperlukan
            110.verticalSpace,
            ButtonGradientAdmin(
              onPressed: () {
                postData();
                Get.back(); // Kembali ke halaman sebelumnya setelah menambahkan
              },
            )
          ],
        ),
      ),
    );
  }
}
