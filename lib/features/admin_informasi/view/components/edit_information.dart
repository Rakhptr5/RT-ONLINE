import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/view/components/admin_informasi_bottomsheet.dart';
import 'package:venturo_core/features/admin_informasi/view/components/top_bar_add_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/button_gradient_admin.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class EditInformasiPage extends StatefulWidget {
  @override
  _EditInformasiPageState createState() => _EditInformasiPageState();
}

class _EditInformasiPageState extends State<EditInformasiPage> {
  final TextEditingController contentController = TextEditingController();
  final AdminInformasiController informationController =
      AdminInformasiController(); // Change this to your controller class

  String? selectedCategory;
  List<Map<String, String>> kategoriesList = [];

  @override
  void initState() {
    super.initState();
    getDataKategories();
  }

  Future<void> _putData(String id, String content, String categoryId) async {
    try {
      final response = await put(
        Uri.parse('https://rtonline-api.venturo.pro/api/v1/informations/$id'),
        body: {
          'description': content,
          'categories_id': categoryId,

          // tambahkan field lain yang ingin diubah
        },
      );
      if (response.statusCode == 200) {
        // Data berhasil diubah
        // Tambahkan logika yang diperlukan setelah data berhasil diubah
      } else {
        print('Status code: ${response.statusCode}');
        print(response.body);
        throw Exception('Failed to update data');
      }
    } catch (error) {
      // Tangani error
      print(error);
    }
  }

  Future<void> getDataKategories() async {
    final response = await get(
        Uri.parse('https://rtonline-api.venturo.pro/api/v1/categories'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData.containsKey('data')) {
        final Map<String, dynamic> data = responseData['data'];
        if (data.containsKey('list')) {
          final List<dynamic> kategoriData = data['list'];
          setState(() {
            kategoriesList = kategoriData.map((item) {
              return {
                'id': item['id'].toString(),
                'name': item['name'].toString()
              };
            }).toList();
          });
        } else {
          throw Exception('Data does not contain list of categories');
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
              title: "Edit Informasi",
            ),
            30.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 320.0),
              child: Text(
                "Kategori",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
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
                  child: DropdownButtonFormField(
                    value: selectedCategory,
                    items: kategoriesList.map((Map<String, String> category) {
                      return DropdownMenuItem<String>(
                        value: category['id'],
                        child: Text(category['name']!),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                    onTap: () {
                      getDataKategories();
                    },
                    decoration: InputDecoration(
                      hintText: selectedCategory != null
                          ? kategoriesList.firstWhere((category) =>
                              category['id'] == selectedCategory)['name']
                          : 'Pilih Kategori',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                10.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: false,
                      context: context,
                      builder: (BuildContext context) {
                        return const AdminInformasiBottomsheet();
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
                        ],
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
              padding: const EdgeInsets.only(right: 290.0),
              child: Text(
                "Isi Informasi",
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
                controller: contentController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Masukkan Isi Informasi',
                  hintStyle: NunitoTextStyle.fw400,
                  border: InputBorder.none,
                ),
              ),
            ),
            25.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 260.0),
              child: Text(
                "Upload Gambar",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            5.verticalSpace,
            // Add your upload image widget here
            320.verticalSpace,
            ButtonGradientAdmin(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
