import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/view/components/add_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/components/admin_info_card.dart';
import 'package:venturo_core/features/admin_informasi/view/components/header_admin_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/components/search_bar_admin.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/add_pengumuman.dart';

import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_admin_pengumuman.dart';
import 'package:venturo_core/features/data_warga/view/components/header_data_warga.dart';
import 'package:venturo_core/features/data_warga/view/components/search_bar_data_warga.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class AdminInformasiScreen extends StatefulWidget {
  AdminInformasiScreen({Key? key}) : super(key: key);

  @override
  _AdminInformasiScreenState createState() => _AdminInformasiScreenState();
}

class _AdminInformasiScreenState extends State<AdminInformasiScreen> {
  bool isSwitched = false;
  final AdminInformasiController informationController =
      Get.put(AdminInformasiController());
  late Future<List<AdminInfoCard>> info;
  String searchTerm = '';

  Future<List<AdminInfoCard>> getInforr() async {
    final response = await get(
        Uri.parse("http://rtonline-api.venturo.pro/api/v1/information"));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      // Print response body to see its structure
      List<AdminInfoCard> info = List<AdminInfoCard>.from(
          jsonResponse['data']['list'].map((e) => AdminInfoCard.fromJson(e)));
      //for (var k in jsonResponse) {
      //KategoriInfo kategori = KategoriInfo.fromJson(k);
      //kategoriInfo.add(kategori);
      //}
      return info;
    } else {
      throw Exception('Error wak');
    }
  }

  void deleteInfo(AdminInfoCard categoryId) async {
    // Buat URL endpoint API penghapusan kategori
    String apiUrl =
        'https://rtonline-api.venturo.pro/api/v1/information/${categoryId.id}'; // Ganti dengan URL yang sesuai

    try {
      // Kirim permintaan DELETE ke API
      Response response = await delete(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Kategori berhasil dihapus dari API
        // Lakukan sesuatu jika diperlukan, seperti memperbarui tampilan
        setState(() {
          info = getInforr();
          // Hapus kategori dari daftar lokal atau refresh daftar kategori
          // Contoh: categories.removeWhere((category) => category.id == categoryId);
        });
        // Tampilkan pesan sukses atau lakukan tindakan lain
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Kategori berhasil dihapus'),
          ),
        );
      } else {
        // Tampilkan pesan kesalahan jika penghapusan gagal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menghapus kategori'),
          ),
        );
      }
    } catch (error) {
      // Tangani kesalahan jika terjadi kesalahan dalam proses penghapusan
      print('Error: $error');
    }
  }

  @override
  void initState() {
    info = getInforr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F5),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 130,
              ),
              // Topbar
              const HeaderAdminInformasi(text: "Informasi"),

              // Search Bar
              Positioned(
                  top: 80,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 8,
                            offset: Offset(4, 3),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                        width: 320,
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              // Icon
                              const Icon(
                                Icons.search_rounded,
                              ),

                              // Divider
                              Container(
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 6.w),
                                height: 25,
                                child: const VerticalDivider(
                                  thickness: 1,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),

                              // Text Field
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      searchTerm = value;
                                    });
                                  },
                                  // Tambahkan value dari searchTerm ke dalam TextField

                                  decoration: InputDecoration(
                                    hintText: 'Cari',
                                    hintStyle: NunitoTextStyle.fw400.copyWith(
                                      color: const Color(0xFFB5B7C4),
                                      fontSize: 14,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          6.verticalSpace,
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // Panggil fungsi getInforr untuk memperbarui data
                setState(() {
                  info = getInforr();
                });
              },
              child: FutureBuilder<List<AdminInfoCard>>(
                future: info,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Tampilkan loading indicator jika future masih berjalan
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    // Filter data berdasarkan searchTerm
                    var filteredData = snapshot.data!
                        .where((data) =>
                            data.description
                                .toLowerCase()
                                .contains(searchTerm.toLowerCase()) ||
                            data.categories_name
                                .toLowerCase()
                                .contains(searchTerm.toLowerCase()))
                        .toList();
                    // Tampilkan daftar kategori jika data sudah tersedia dan tidak kosong
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 15),
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(snapshot.data![index].id.toString()),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            deleteInfo(snapshot.data![index]);
                            setState(() {
                              snapshot.data!.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Item telah dihapus")),
                            );
                          },
                          background: Container(
                            color: Colors.red,
                            child: Icon(Icons.delete, color: Colors.white),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    20.0), // Sesuaikan padding horizontal
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context)
                                .size
                                .width, // Menyesuaikan lebar Dismissible
                            child: AdminInfoCard(
                              id: filteredData[index].id,
                              description: filteredData[index].description,
                              categories_name:
                                  filteredData[index].categories_name,
                              photo_url: filteredData[index].photo_url,
                              categories_id: filteredData[index].categories_id,
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    // Tampilkan pesan kesalahan jika terjadi kesalahan
                    return Text('Terjadi kesalahan: ${snapshot.error}');
                  } else {
                    // Tampilkan pesan jika data belum tersedia
                    return Text('Data belum tersedia');
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
  // Placeholder function for updating announcement