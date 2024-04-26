import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/button_gradient_admin.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_add_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/upload_gambar_admin.dart';
import 'package:venturo_core/features/pembayaran/view/components/upload_gambar.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

import 'dart:io';

import 'package:http/http.dart' as http;

class AddAnnouncementPage extends StatefulWidget {
  @override
  _AddAnnouncementPageState createState() => _AddAnnouncementPageState();
}

class _AddAnnouncementPageState extends State<AddAnnouncementPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  File? _imageFile; // Menyimpan file gambar yang dipilih

  Future<void> postAnnouncement() async {
    final String title = titleController.text;
    final String content = contentController.text;

    var request = http.MultipartRequest('POST',
        Uri.parse('https://rtonline-api.venturo.pro/api/v1/announcements'));
    request.fields.addAll({
      'title': title,
      'description': content,
    });
    if (_imageFile != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'photo', // Sesuaikan dengan nama field yang diharapkan oleh server
        _imageFile!.path,
      ));
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      print('Announcement posted successfully');
    } else {
      print('Failed to post announcement: ${response.body}');
    }
  }

  // Method untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
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
              title: "Tambah Pengumuman",
            ),

            30.verticalSpace,

            Padding(
              padding: const EdgeInsets.only(right: 340.0),
              child: Text(
                "Judul",
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
                  hintText: 'Masukkan Judul Pengumuman',
                  hintStyle: NunitoTextStyle.fw400,
                  border: InputBorder.none,
                ),
              ),
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

            //DIBAWAH INI MERUPAKAN BUTTON UPLOAD GAMBAR
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
                  ElevatedButton(
                    onPressed:
                        _pickImage, // Panggil method untuk memilih gambar
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF094282),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Choose File',
                      style: TextStyle(
                        fontFamily: 'NunitoBold',
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),

                  SizedBox(width: 10), // Spacer
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Upload Gambar Disini',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.0,
                            fontFamily: 'NunitoReg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Tambahkan input untuk upload gambar jika diperlukan
            320.verticalSpace,
            ButtonGradientAdmin(
              onPressed: () {
                final content = contentController.text;
                final title = titleController.text;
                setState(() {});
                if (content.isNotEmpty && title.isNotEmpty) {
                  postAnnouncement();
                  Navigator.pop(
                      context); // Menggunakan Navigator.pop() untuk kembali ke halaman sebelumnya
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Harap isi semua field'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
