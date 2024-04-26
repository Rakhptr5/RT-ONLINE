// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/admin_informasi/models/kategori.dart';
import 'package:venturo_core/features/admin_informasi/view/components/button_gradient_admin.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/button_gradient_admin.dart';
import 'package:venturo_core/features/data_warga/view/components/button_gradient_data_warga.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:http/http.dart';

class AdminInformasiBottomsheet extends StatefulWidget {
  const AdminInformasiBottomsheet({Key? key}) : super(key: key);

  @override
  _AdminInformasiBottomsheetState createState() =>
      _AdminInformasiBottomsheetState();
}

class _AdminInformasiBottomsheetState extends State<AdminInformasiBottomsheet> {
  bool isAddingCategory = false;
  List<String> categories = [];
  late Future<List<KategoriInfo>> kategoriInfo;
  Future<List<KategoriInfo>> getKategori() async {
    final response = await get(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/categories"));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      // Print response body to see its structure
      List<KategoriInfo> kategoriInfo = List<KategoriInfo>.from(
          jsonResponse['data']['list'].map((e) => KategoriInfo.fromJson(e)));
      //for (var k in jsonResponse) {
      //KategoriInfo kategori = KategoriInfo.fromJson(k);
      //kategoriInfo.add(kategori);
      //}
      return kategoriInfo;
    } else {
      throw Exception('Error wak');
    }
  }

  Future deleteCategory(KategoriInfo categoryId) async {
    // Buat URL endpoint API penghapusan kategori
    String apiUrl =
        'https://rtonline-api.venturo.pro/api/v1/categories/${categoryId.id}'; // Ganti dengan URL yang sesuai

    try {
      // Kirim permintaan DELETE ke API
      Response response = await delete(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Kategori berhasil dihapus dari API
        // Lakukan sesuatu jika diperlukan, seperti memperbarui tampilan
        setState(() {
          kategoriInfo = getKategori();
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan saat menghapus kategori'),
        ),
      );
    }
  }

  TextEditingController categoryNameController =
      TextEditingController(); // Tambahkan controller untuk TextField

  // Metode untuk menambahkan kategori melalui POST API
  Future addCategory(String categoryName) async {
    String apiUrl = 'https://rtonline-api.venturo.pro/api/v1/categories';
    try {
      Response response = await post(Uri.parse(apiUrl),
          body: jsonEncode({'name': categoryName}),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        // Kategori berhasil ditambahkan
        setState(() {
          kategoriInfo = getKategori();
          isAddingCategory =
              false; // Tutup TextField setelah kategori ditambahkan
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Kategori berhasil ditambahkan'),
          ),
        );
      } else {
        // Tampilkan pesan kesalahan jika penambahan gagal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menambahkan kategori'),
          ),
        );
      }
    } catch (error) {
      // Tangani kesalahan jika terjadi kesalahan dalam proses penambahan
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan saat menambahkan kategori'),
        ),
      );
    }
  }

// Metode untuk mengedit kategori melalui PUT API
  Future editCategory(KategoriInfo categoryInfo) async {
    String apiUrl =
        'https://rtonline-api.venturo.pro/api/v1/categories/${categoryInfo.id}';
    try {
      Response response = await put(Uri.parse(apiUrl),
          body: jsonEncode({'name': categoryInfo.name}),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        // Di dalam metode editCategory setelah melakukan permintaan PUT

        // Kategori berhasil diedit
        setState(() {
          kategoriInfo = getKategori();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Kategori berhasil diedit'),
          ),
        );
      } else {
        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        // Tampilkan pesan kesalahan jika pengeditan gagal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal mengedit kategori'),
          ),
        );
      }
    } catch (error) {
      // Tangani kesalahan jika terjadi kesalahan dalam proses pengeditan
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan saat mengedit kategori'),
        ),
      );
    }
  }

  @override
  void initState() {
    kategoriInfo = getKategori();
  }

  @override
  Widget build(BuildContext context) {
    // Container
    return Column(
      children: [
        Container(
          width: 430.w,
          height: isAddingCategory ? 490.w : 490.w,
          padding: EdgeInsets.only(
            top: 12.w,
            left: 24.w,
            right: 24.w,
            bottom: 0.w,
          ),
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
          child: Column(
            children: [
              // Text
              ////container hitam
              Container(
                width: 100.w,
                height: 5.w,
                decoration: ShapeDecoration(
                  color: Color.fromARGB(255, 27, 29, 31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              10.verticalSpace,
              Row(
                children: [
                  // Button Tambah Kategori
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAddingCategory = !isAddingCategory;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
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
                              isAddingCategory ? Icons.remove : Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

// Tambahkan logika tampilkan TextField

// Tambahkan logika tampilkan Button Simpan

                  60.horizontalSpace,
                  Container(
                    height: 30.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Tambah Kategori',
                        style: NunitoTextStyle.fw600.copyWith(
                          color: Colors.black,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (isAddingCategory)
                Expanded(
                  child: TextField(
                    controller: categoryNameController,
                    decoration: InputDecoration(
                      labelText: 'Nama Kategori',
                    ),
                  ),
                ),

              FutureBuilder<List<KategoriInfo>>(
                future: kategoriInfo,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Tampilkan loading indicator jika future masih berjalan
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    // Tampilkan daftar kategori jika data sudah tersedia
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data![index].name,
                                      overflow: TextOverflow.ellipsis,
                                      style: NunitoTextStyle.fw800
                                          .copyWith(fontSize: 17),
                                    ),
                                    Spacer(),

                                    //Button Edit Disini
                                    IconButton(
                                      onPressed: () {
                                        // Tampilkan dialog atau widget untuk memasukkan data kategori yang ingin diubah
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Edit Kategori'),
                                              content: TextField(
                                                controller:
                                                    TextEditingController(
                                                        text: snapshot
                                                            .data![index].name),
                                                onChanged: (value) {
                                                  // Update data kategori saat nilai berubah
                                                  snapshot.data![index].name =
                                                      value;
                                                },
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    // Tutup dialog
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Batal'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    // Kirim permintaan untuk mengedit kategori
                                                    editCategory(
                                                        snapshot.data![index]);
                                                    setState(() {
                                                      kategoriInfo =
                                                          getKategori();
                                                    });
                                                    // Tutup dialog
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Simpan'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Container(
                                        height: 25,
                                        child: Image.asset(
                                            'assets/images/edit.png'),
                                      ),
                                    ),
                                    //Button Delete disini
                                    IconButton(
                                        onPressed: () {
                                          deleteCategory(snapshot.data![index]);
                                        },
                                        icon: Icon(Icons.close))
                                  ],
                                ),
                                Divider()
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // Tampilkan pesan kesalahan jika terjadi kesalahan
                    return Text('Terjadi kesalahan: ${snapshot.error}');
                  } else {
                    // Kasus lainnya (contoh: future belum dimulai)
                    return Text('Menunggu...');
                  }
                },
              ),
              30.verticalSpace,
              ButtonGradientAdmin(onPressed: () async {
                await addCategory(categoryNameController.text);
                setState(
                  () {
                    kategoriInfo = getKategori();
                    isAddingCategory = false;
                  },
                );
                categoryNameController.clear();
                addCategory(categoryNameController.text);
              }),
              10.verticalSpace
            ],
          ),
        ),
      ],
    );
  }
}
