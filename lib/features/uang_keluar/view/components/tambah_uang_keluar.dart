// AddAnnouncementPage.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/button_gradient_admin.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_add_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/upload_gambar_admin.dart';
import 'package:venturo_core/features/kategori_iuran/controllers/kategori_iuran_controller.dart';
import 'package:venturo_core/features/kategori_iuran/view/components/upload_gambar_admin.dart';
import 'package:venturo_core/features/pembayaran/view/components/upload_gambar.dart';
import 'package:venturo_core/features/uang_keluar/controllers/uang_keluar_controller.dart';
import 'package:venturo_core/features/uang_keluar/view/components/button_gradient_uang_keluar.dart';
import 'package:venturo_core/features/uang_masuk/view/components/text_field_uang_masuk.dart';
import 'package:venturo_core/features/uang_masuk/view/components/upload_gambar_admin.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class AddUangKeluarScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final UangKeluarController uangmasukController =
      Get.put(UangKeluarController());

  final KategoriIuranController kategoriController =
      Get.put(KategoriIuranController());
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBarAdminPengumuman2(
              title: "Tambah Uang Keluar",
            ),

            30.verticalSpace,

            Padding(
              padding: const EdgeInsets.only(right: 198.0),
              child: Text(
                "Keterangan Pengeluaran",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
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
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Keterangan',
                  hintStyle: NunitoTextStyle.fw400,
                  border: InputBorder.none,
                ),
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 290.0),
              child: Text(
                "Harga Total",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            5.verticalSpace,

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
                        controller: totalController,
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
            Padding(
              padding: const EdgeInsets.only(right: 320.0),
              child: Text(
                "Tanggal",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            5.verticalSpace,

            //ini textfield date
            TextFieldUangMasuk2(
                controller: dateController,
                hint: 'Pilih Tanggal',
                icon: "assets/images/ic_calendar.png",
                label: "",
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
                    dateController.text = formattedDate;
                  }
                }),
            5.verticalSpace,
            Divider(),

            //2
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Keterangan",
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
                controller: contentController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Keterangan',
                  hintStyle: NunitoTextStyle.fw400,
                  border: InputBorder.none,
                ),
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 290.0),
              child: Text(
                "Qty(Banyak)",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
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
                controller: qtyController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Kuantitas',
                  hintStyle: NunitoTextStyle.fw400,
                  border: InputBorder.none,
                ),
              ),
            ),

            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 315.0),
              child: Text(
                "Nominal",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            5.verticalSpace,

            NominalField2(),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 330.0),
              child: Text(
                "Bukti",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            5.verticalSpace,
            UploadGambarAdmin(),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 260.0),
              child: ButtonGradientUang(),
            ),
            110.verticalSpace,

            ButtonGradientAdmin(
              onPressed: () {
                final content = contentController.text;
                final nominal = nominalController.text;
                final date = dateController.text;
                final qty = qtyController.text;
                final total = totalController.text;
                final title = titleController.text;

                // Path gambar bisa diberikan sesuai dengan kebutuhan

                if (title.isNotEmpty) {
                  uangmasukController.addUangkeluar(
                    UangKeluar(
                      content: content,
                      nominal: nominal,
                      qty: qty,
                      total: total,
                      date: date,
                      title: title,
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
