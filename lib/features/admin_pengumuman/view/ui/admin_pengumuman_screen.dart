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
import 'package:venturo_core/features/admin_pengumuman/view/components/admin_pengumuman_card.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/edit_announcement.dart';

import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_admin_pengumuman.dart';
import 'package:venturo_core/features/data_warga/view/components/header_data_warga.dart';
import 'package:venturo_core/features/data_warga/view/components/search_bar_data_warga.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class AdminPengumumanScreen extends StatefulWidget {
  AdminPengumumanScreen({Key? key}) : super(key: key);

  @override
  _AdminPengumumanScreenState createState() => _AdminPengumumanScreenState();
}

class _AdminPengumumanScreenState extends State<AdminPengumumanScreen> {
  bool isSwitched = false;
  final AdminPengumumanController informationController =
      Get.put(AdminPengumumanController());
  late Future<List<AdminPengumumanCard>> announcement;

  Future<List<AdminPengumumanCard>> getAnno() async {
    final response = await get(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/announcements"));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      // Print response body to see its structure
      List<AdminPengumumanCard> announcement = List<AdminPengumumanCard>.from(
          jsonResponse['data']['list']
              .map((e) => AdminPengumumanCard.fromJson(e)));
      //for (var k in jsonResponse) {
      //KategoriInfo kategori = KategoriInfo.fromJson(k);
      //kategoriInfo.add(kategori);
      //}
      return announcement;
    } else {
      throw Exception('Error wak');
    }
  }

  void deleteInfo(AdminPengumumanCard categoryId) async {
    // Buat URL endpoint API penghapusan kategori
    String apiUrl =
        'https://rtonline-api.venturo.pro/api/v1/announcements/${categoryId.id}'; // Ganti dengan URL yang sesuai

    try {
      // Kirim permintaan DELETE ke API
      Response response = await delete(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Kategori berhasil dihapus dari API
        // Lakukan sesuatu jika diperlukan, seperti memperbarui tampilan
        setState(() {
          announcement = getAnno();
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
    announcement = getAnno();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F5),
      body: Column(
        children: [
          // Topbar
          const TopBarAdminPengumuman(),

          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // Panggil fungsi getInforr untuk memperbarui data
                setState(() {
                  announcement = getAnno();
                });
              },
              child: FutureBuilder<List<AdminPengumumanCard>>(
                future: announcement,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Tampilkan loading indicator jika future masih berjalan
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    // Tampilkan daftar kategori jika data sudah tersedia dan tidak kosong
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 15),
                      itemCount: snapshot.data!.length,
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
                            height: 110,
                            width: 358.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 8.w),
                            decoration: ShapeDecoration(
                                color: Color.fromARGB(255, 211, 14, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            child: Icon(Icons.delete, color: Colors.white),
                            alignment: Alignment.centerRight,
                            // Sesuaikan padding horizontal
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: AdminPengumumanCard(
                              id: snapshot.data![index].id,
                              description: snapshot.data![index].description,
                              title: snapshot.data![index].title,
                              pinned: snapshot.data![index].pinned,
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

  // Placeholder function for updating announcement
  void updateInformation(int index) {
    // Add your logic here to update the announcement
    // announcementController.updateAnnouncement(index);
    GestureDetector(
      onTap: () {
        Get.to(AddInformasiPage());
      },
    );
  }
}
