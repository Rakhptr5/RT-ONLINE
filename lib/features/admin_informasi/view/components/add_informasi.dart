// AddInformasiPage.dart
import 'dart:convert';
import 'dart:math';

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
import 'package:venturo_core/features/laporan_pembayaran/view/components/laporan_pembayaran_bottomsheet.dart';
import 'package:venturo_core/features/pembayaran/view/components/upload_gambar.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class AddInformasiPage extends StatefulWidget {
  @override
  _AddInformasiPageState createState() => _AddInformasiPageState();
}

class _AddInformasiPageState extends State<AddInformasiPage> {
  final TextEditingController contentController = TextEditingController();
  final AdminInformasiController informationController =
      Get.put(AdminInformasiController());

  String? selectedCategory; // Added this line
  List<Map<String, String>> kategoriesList = [];
  // List untuk menyimpan data dari API

  @override
  void initState() {
    super.initState();
    // Panggil fungsi untuk mengambil data dari API saat widget diinisialisasi
    getDataKategories();
  }

  Future<void> _postData() async {
    try {
      if (selectedCategory != null) {
        final response = await post(
          Uri.parse('https://rtonline-api.venturo.pro/api/v1/information'),
          body: {
            'description': contentController.text,
            'categories_id': selectedCategory!,
            'categories_name': kategoriesList.firstWhere(
                (category) => category['id'] == selectedCategory)['name'],
          },
        );

        if (response.statusCode == 200) {
          if (mounted) {
            // Check if the widget is still mounted
            setState(() {
              // Set the state here
              print('Informasi berhasil dipost');
            });
          }
          // Handle berhasil
          // Tambahkan logika lain yang diperlukan setelah posting berhasil
        } else {
          // Handle gagal
          print('Gagal memposting informasi');
          // Tambahkan logika lain yang diperlukan jika posting gagal
        }
      } else {
        print('Harap pilih kategori');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
      // Tambahkan logika lain yang diperlukan untuk menangani error
    }
  }

  Future<void> getDataKategories() async {
    try {
      final response = await get(
          Uri.parse('https://rtonline-api.venturo.pro/api/v1/categories'));
      if (response.statusCode == 200) {
        // Parse JSON response
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData.containsKey('data')) {
          final Map<String, dynamic> data = responseData['data'];
          if (data.containsKey('list')) {
            final List<dynamic> kategoriData = data['list'];
            if (mounted) {
              // Check if the widget is still mounted
              setState(() {
                kategoriesList = kategoriData.map((item) {
                  // Menggunakan sebuah map untuk menyimpan id dan name dari setiap kategori
                  return {
                    'id': item['id'].toString(),
                    'name': item['name'].toString()
                  };
                }).toList();
              });
            }
          } else {
            throw Exception('Data does not contain list of categories');
          }
        } else {
          throw Exception('Response does not contain data');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
      // Tambahkan logika lain yang diperlukan untuk menangani error
    }
  }

  Future<void> deleteData(String id) async {
    final response = await delete(
        Uri.parse('https://rtonline-api.venturo.pro/api/v1/categories/$id'));
    if (response.statusCode == 200) {
      // Refresh data after deletion
      getDataKategories();
    } else {
      throw Exception('Failed to delete data');
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
              title: "Tambah Informasi",
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

                  //DIBAWAH INI ADALAH DROPDOWN YANG SAYA MAKSUD
                  child: DropdownButtonFormField(
                    value: selectedCategory,
                    items: kategoriesList.map((Map<String, String> category) {
                      return DropdownMenuItem<String>(
                        value: category['id'], // Gunakan id sebagai value
                        child:
                            Text(category['name']!), // Tampilkan nama kategori
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                    onTap: () {
                      // Panggil getDataKategories() saat dropdown dibuka/diklik
                      getDataKategories();
                    },
                    decoration: InputDecoration(
                      hintText: selectedCategory != null
                          ? kategoriesList.firstWhere((category) =>
                                  category['id'] == selectedCategory)[
                              'name'] // Tampilkan nama kategori yang dipilih
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
            UploadGambarAdmin(),
            320.verticalSpace,
            ButtonGradientAdmin(
              onPressed: () {
                final content = contentController.text;
                final title = selectedCategory ?? 'Default Title';
                setState(() {
                  getDataKategories();
                });
                if (content.isNotEmpty && selectedCategory != null) {
                  _postData(); // Panggil metode untuk melakukan posting
                  Get.back(); // Kembali ke halaman sebelumnya setelah menambahkan
                } else {
                  // Tampilkan pesan jika input kosong
                  Get.snackbar('Error', 'Harap isi semua field');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
