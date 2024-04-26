// AddAnnouncementPage.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/view/components/admin_informasi_bottomsheet.dart';
import 'package:venturo_core/features/admin_informasi/view/components/top_bar_add_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/button_gradient_admin.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_add_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/upload_gambar_admin.dart';
import 'package:venturo_core/features/kategori_iuran/view/components/upload_gambar_admin.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/components/laporan_pembayaran_bottomsheet.dart';
import 'package:venturo_core/features/pembayaran/view/components/upload_gambar.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';
import 'package:venturo_core/features/uang_masuk/controllers/uang_masuk_controller.dart';
import 'package:venturo_core/features/uang_masuk/view/components/text_field_laporan.dart';
import 'package:venturo_core/features/uang_masuk/view/components/text_field_uang_masuk.dart';
import 'package:venturo_core/features/uang_masuk/view/components/upload_gambar_admin.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class AddUangMasukPage extends StatelessWidget {
  final TextEditingController contentController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final UangMasukController uangmasukController =
      Get.put(UangMasukController());

  String? selectedCategory; // Added this line
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<String> nama = [
      'Ahmad Sujadi',
      'Yudi Agung',
      'Andika Rahmat',
    ];
    List<String> pemasukan = [
      'Iuran',
      'Lain-lain',
    ];
    List<String> bulan = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    List<String> penerima = [
      'Maryadi',
      'Abdullah',
      'Budiyono',
    ];

    return Scaffold(
      backgroundColor: Color(0xFFEFF0F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBarAdminInformasi(
              title: "Tambah Uang Masuk",
            ),

            20.verticalSpace,

            Padding(
              padding: const EdgeInsets.only(right: 340.0),
              child: Text(
                "Nama",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            9.verticalSpace,

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
              child: DropdownButtonFormField(
                value: selectedCategory,
                items: nama.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Set selectedCategory sesuai dengan opsi yang dipilih
                  selectedCategory = newValue;
                },
                decoration: InputDecoration(
                  hintText: 'Pilih Nama',
                  hintStyle: NunitoTextStyle.fw400,
                  border: InputBorder.none,
                ),
              ),
            ),
            12.verticalSpace,

            Padding(
              padding: const EdgeInsets.only(right: 260.0),
              child: Text(
                "Jenis Pemasukan",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            9.verticalSpace,

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
              child: DropdownButtonFormField(
                value: selectedCategory,
                items: pemasukan.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Set selectedCategory sesuai dengan opsi yang dipilih
                },
                decoration: InputDecoration(
                  hintText: 'Pilih Iuran',
                  hintStyle: NunitoTextStyle.fw400,
                  border: InputBorder.none,
                ),
              ),
            ),
            10.horizontalSpace,
            12.verticalSpace,

            Padding(
              padding: const EdgeInsets.only(right: 340.0),
              child: Text(
                "Bulan",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            9.verticalSpace,

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
              child: DropdownButtonFormField(
                value: selectedCategory,
                items: bulan.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Set selectedCategory sesuai dengan opsi yang dipilih
                },
                decoration: InputDecoration(
                  hintText: 'Pilih Bulan',
                  hintStyle: NunitoTextStyle.fw400,
                  border: InputBorder.none,
                ),
              ),
            ),
            10.horizontalSpace,
            12.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 320.0),
              child: Text(
                "Nominal",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            9.verticalSpace,
            Container(
              width: 380.0,
              height: 47.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
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
                    width: 47, // Adjust the width as needed
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
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
                      padding: const EdgeInsets.only(right: 8.0, bottom: 7),
                      child: TextField(
                        controller: nominalController,
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
            12.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 325.0),
              child: Text(
                "Tanggal",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            9.verticalSpace,
            TextFieldUangMasuk2(
                controller: contentController,
                hint: 'Masukkan Tempat, Tanggal Lahir',
                icon: "assets/images/ic_calendar.png",
                label: "Tempat, Tanggal Lahir",
                textInputType: TextInputType.text,
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  if (selectedDate != null) {
                    // Format tanggal menggunakan DateFormat
                    String formattedDate = DateFormat(
                      'EEEE, d MMMM y',
                    ).format(selectedDate);
                    contentController.text = formattedDate;
                  }
                }),

            12.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 275.0),
              child: Text(
                "Diterima Oleh",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),

            9.verticalSpace,

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
              child: DropdownButtonFormField(
                value: selectedCategory,
                items: penerima.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Set selectedCategory sesuai dengan opsi yang dipilih
                },
                decoration: InputDecoration(
                  hintText: 'Pilih Penerima',
                  hintStyle: NunitoTextStyle.fw400,
                  border: InputBorder.none,
                ),
              ),
            ),
            10.horizontalSpace,
            12.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 340.0),
              child: Text(
                "Bukti",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),

            9.verticalSpace,
            UploadGambarAdmin(),
            // Tambahkan input untuk upload gambar jika diperlukan
            90.verticalSpace,
            ButtonGradientAdmin(
              onPressed: () {
                final content = contentController.text;
                final nominal = nominalController.text;

                // Path gambar bisa diberikan sesuai dengan kebutuhan

                if (nominal.isNotEmpty) {
                  uangmasukController.addUangmasuk(
                    UangMasuk(
                      content: content,
                      nominal: nominal,
                      category: selectedCategory,
                      title: '',
                    ),
                  );
                  Get.back(); // Kembali ke halaman sebelumnya setelah menambahkan
                } else {
                  // Tampilkan pesan jika input kosong
                  Get.snackbar('Error', 'Harap isi semua field');
                }
              },
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
