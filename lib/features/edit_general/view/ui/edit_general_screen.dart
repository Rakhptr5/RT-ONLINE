import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_bottomsheet.dart';
import 'package:venturo_core/features/edit_general/view/components/drop_down_bank.dart';
import 'package:venturo_core/features/edit_general/view/components/drop_down_kode_pos.dart';
import 'package:venturo_core/features/edit_general/view/components/drop_down_provinsi.dart';
import 'package:venturo_core/features/edit_general/view/components/drop_down_kota.dart';
import 'package:venturo_core/features/edit_general/view/components/drop_down_kecamatan.dart';
import 'package:venturo_core/features/edit_general/view/components/edit_general_card%20copy.dart';
import 'package:venturo_core/features/edit_general/view/components/edit_general_card.dart';
import 'package:venturo_core/features/edit_general/view/components/edit_general_card2.dart';
import 'package:venturo_core/features/edit_general/view/components/top_bar_edit_general.dart';
import 'package:venturo_core/features/general/models/citizen.dart';
import 'package:venturo_core/features/general/models/generales.dart';
import 'package:venturo_core/features/general/view/components/top_bar_general.dart';
import 'package:venturo_core/features/profile/view/components/bottom_sheet_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/button_gradient_profile.dart';
import 'package:venturo_core/features/profile/view/components/drop_down_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/profile_card.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/top_bar_profile.dart';
import 'package:venturo_core/features/undang_warga/view/components/drop_down_hak_akses.dart';
import 'package:venturo_core/features/undang_warga/view/components/drop_down_nomor_rumah%20copy.dart';
import 'package:venturo_core/features/undang_warga/view/components/drop_down_nomor_rumah.dart';
import 'package:venturo_core/features/undang_warga/view/components/profile_card_admin.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/edit_general/view/components/drop_down_bank.dart';
import 'package:venturo_core/features/edit_general/view/components/drop_down_kode_pos.dart';
import 'package:venturo_core/features/edit_general/view/components/drop_down_provinsi.dart';
import 'package:venturo_core/features/edit_general/view/components/drop_down_kota.dart';
import 'package:venturo_core/features/edit_general/view/components/drop_down_kecamatan.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class EditGeneralScreen extends StatefulWidget {
  const EditGeneralScreen({Key? key}) : super(key: key);

  @override
  _EditGeneralScreenState createState() => _EditGeneralScreenState();
}

class _EditGeneralScreenState extends State<EditGeneralScreen> {
  late TextEditingController controller;
  late TextEditingController controller2;
  late TextEditingController controllerEditRT;
  late TextEditingController controllerEditRW;
  late TextEditingController controllerEditAlamat;
  late TextEditingController controllerEditPenanggungJawab;
  late TextEditingController controllerEditNoTelepon;
  late TextEditingController controllerEditNamaBank;
  late TextEditingController controllerEditNoRekening;
  late TextEditingController controllerEditNamaPemilik;
  late String selectedProvince =
      ""; // Anda perlu menyesuaikan tipe data dengan kebutuhan
  late String selectedCity =
      ""; // Anda perlu menyesuaikan tipe data dengan kebutuhan
  late String selectedDistrict =
      ""; // Anda perlu menyesuaikan tipe data dengan kebutuhan
  late String selectedKodePos =
      ""; // Anda perlu menyesuaikan tipe data dengan kebutuhan

// Misalnya, Anda bisa menggunakan List<Map<String, String>> untuk variabel berikut:
  late List<Map<String, String>> listControllerEditJabatan;
  late List<Map<String, String>> listControllerEditNama;
  late Future<General> _futureGeneral;

  Future<General> fetchGeneralData() async {
    final response = await get(
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

  Future<void> editGeneral() async {
    try {
      var body = {
        "id": "242ad87f-a79d-439a-b3dd-09fff28fbf44",
        "rt": controllerEditRT.value.text,
        "rw": controllerEditRW.value.text,
        "address": controllerEditAlamat.value.text,
        "province": selectedProvince,
        "city": selectedCity,
        "district": selectedDistrict,
        "post_code": selectedKodePos,
        "responsible_person": controllerEditPenanggungJawab.value.text,
        "phone_number": controllerEditNoTelepon.value.text,
        "bank": {
          "id": "028f7a02-7b05-4afc-8ce2-6e20a2907e1a",
          "name": controllerEditNamaBank.value.text,
          "no_rek": controllerEditNoRekening.value.text,
          "holder_name": controllerEditNamaPemilik.value.text,
        },
        "structure": [
          {
            "id": "36557d9f-e5cf-4c43-9c92-02fcf7f7d7ba",
            "position": listControllerEditJabatan[0],
            "citizen_id": listControllerEditNama[0],
          },
          {
            "id": "667528e7-08fa-4fee-b893-e317f72540e2",
            "position": listControllerEditJabatan[1],
            "citizen_id": listControllerEditNama[1],
          },
          {
            "id": "a4d718ec-8329-4f2e-b4af-835b4c65fec1",
            "position": listControllerEditJabatan[2],
            "citizen_id": listControllerEditNama[2],
          },
          {
            "id": "d68ef507-8107-4542-91a8-f6c31c1a5b48",
            "position": listControllerEditJabatan[3],
            "citizen_id": listControllerEditNama[3],
          }
        ]
      };

      var response = await put(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/residence"),
        body: jsonEncode(body),
        // Tentukan tipe konten sebagai application/json
        headers: {"Content-Type": "application/json"},
      );

      print(body);

      print(response.statusCode);

      if (response.statusCode == 200) {
        // Kategori Informasi berhasil ditambahkan
        print('General berhasil diedit');

        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'General berhasil Diedit',
          snackPosition: SnackPosition.TOP,
        );
        // Kemudian, perbarui data Kategori Informasi
      } else {
        Get.closeAllSnackbars();
        Get.snackbar(
          'Failed',
          'Gagal Edit Genreal',
          snackPosition: SnackPosition.TOP,
        );
        throw Exception('Gagal menambahkan Kategori Informasi');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller2 = TextEditingController();
    _futureGeneral = fetchGeneralData();
    controllerEditRW = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F5),
      body: FutureBuilder<General>(
        future: _futureGeneral,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(), // Show a loading indicator
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'), // Show an error message
            );
          } else if (snapshot.hasData) {
            final generalData = snapshot.data!;
            final getData = generalData.list[0];
            return SingleChildScrollView(
                child: Column(
              children: [
                // Topbar
                const TopBarEditGeneral(title: "General"),

                32.verticalSpace,

                Padding(
                  padding: const EdgeInsets.only(right: 130.0),
                  child: Text(
                    "Informasi Perumahan",
                    style: PoppinsTextStyle.fw600.copyWith(fontSize: 23),
                  ),
                ),

                20.verticalSpace,

                // TextField
                Row(
                  children: [
                    20.horizontalSpace,
                    SizedBox(
                      width: 180.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'RT',
                            style: NunitoTextStyle.fw700.copyWith(
                              color: const Color(0xFF0B0C0D),
                              fontSize: 14.sp,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 4.w),
                            decoration: ShapeDecoration(
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x19000000),
                                    blurRadius: 8,
                                    offset: Offset(4, 3),
                                    spreadRadius: 0,
                                  )
                                ],
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                )),
                            height: 38.w,

                            //DIBAWAH INI TEXTFIELD RT
                            child: TextField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              controller: TextEditingController(
                                  text: getData.rt != 0
                                      ? getData.rt.toString()
                                      : ''),
                              onChanged: (value) {
                                setState(() {
                                  // Parse the string value to an integer if it's not empty
                                  if (value.isNotEmpty) {
                                    getData.rt = int.tryParse(value) ?? 0;
                                  } else {
                                    // Jika string kosong, atur nilai RT menjadi 0
                                    getData.rt = 0;
                                  }
                                });
                                // Menambahkan fungsi onChanged untuk menangani perubahan nilai dalam TextField
                                // Anda dapat menambahkan logika untuk memperbarui nilai saat pengguna mengubah teks di sini
                                // Contoh: setState(() { getData.alamat = value; });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.horizontalSpace,

                    // TextField
                    TextFieldEditGeneral2(
                      desc: getData.rw.toString(),
                      label: 'RW',
                      controller: controllerEditRW,
                    ),
                  ],
                ),

                20.verticalSpace,

                // TextField
                const TextFieldEditGeneral(
                  tanggal: "Jl. Sukarno Hatta",
                  label: "Alamat",
                ),

                20.verticalSpace,

                DropDownProvinsi(
                  hint: "Pilih Provinsi",
                  label: "Provinsi",
                  icon: "assets/images/ic_arrow_ios_down.png",
                  textInputType: TextInputType.text,
                  controller: controller2,
                ),

                20.verticalSpace,

                DropDownKota(
                  hint: "Pilih Kota/Kabupaten",
                  label: "Kota/Kabupaten",
                  icon: "assets/images/ic_arrow_ios_down.png",
                  textInputType: TextInputType.text,
                  controller: controller2,
                ),
                20.verticalSpace,
                DropDownKecamatan(
                  hint: "Pilih Kecamatan",
                  label: "Kecamatan",
                  icon: "assets/images/ic_arrow_ios_down.png",
                  textInputType: TextInputType.text,
                  controller: controller2,
                ),

                20.verticalSpace,

                DropDownKodePos(
                  hint: "Pilih Kode Pos",
                  label: "Kode Pos",
                  icon: "assets/images/ic_arrow_ios_down.png",
                  textInputType: TextInputType.text,
                  controller: controller2,
                ),

                20.verticalSpace,
                // Agama

                const TextFieldEditGeneral(
                  tanggal: "Jojo",
                  label: "Penanggung Jawab",
                ),

                20.verticalSpace,
                // Agama
                const TextFieldEditGeneral(
                  tanggal: "08123456789",
                  label: "No. Handphone",
                ),
                20.verticalSpace,

                Row(
                  children: [
                    20.horizontalSpace,
                    Padding(
                      padding: const EdgeInsets.only(right: 215.0),
                      child: Text(
                        "Struktur RT",
                        style: PoppinsTextStyle.fw600.copyWith(fontSize: 23),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF6EE2F5),
                              Color(0xFF6454F0),
                            ], // Ganti dengan warna sesuai keinginan
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(2),
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
                            size: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                20.verticalSpace,

                const TextFieldEditGeneral3(
                  tanggal: "Joko",
                  label: "Nama",
                ),

                20.verticalSpace,

                const TextFieldEditGeneral(
                  tanggal: "Ketua RT",
                  label: "Jabatan",
                ),

                20.verticalSpace,
                // Agama

                const TextFieldEditGeneral3(
                  tanggal: "Dara",
                  label: "Nama",
                ),

                20.verticalSpace,
                // Agama
                const TextFieldEditGeneral(
                  tanggal: "Bendahara",
                  label: "Jabatan",
                ),
                20.verticalSpace,

                Padding(
                  padding: const EdgeInsets.only(right: 210.0),
                  child: Text(
                    "List Akun Bank",
                    style: PoppinsTextStyle.fw600.copyWith(fontSize: 23),
                  ),
                ),
                20.verticalSpace,

                DropDownBank(
                  hint: "Pilih Bank",
                  label: "Nama Bank",
                  icon: "assets/images/ic_arrow_ios_down.png",
                  textInputType: TextInputType.text,
                  controller: controller2,
                ),

                20.verticalSpace,

                const TextFieldEditGeneral(
                  tanggal: "6126789",
                  label: "No. Rekening",
                ),

                20.verticalSpace,
                // Agama

                const TextFieldEditGeneral(
                  tanggal: "Dara",
                  label: "Nama Pemilik Rekening",
                ),

                25.verticalSpace,

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      editGeneral();
                    });
                    // Fungsi yang dijalankan ketika tombol ditekan
                    // Misalnya, Anda dapat menambahkan logika untuk menyimpan data di sini
                    print('Data disimpan');
                  },
                  child: Text('Simpan'),
                ),
              ],
            ));
          } else {
            return Center(
              child:
                  Text('No data available'), // Handle case when there's no data
            );
          }
        },
      ),
    );
  }
}
