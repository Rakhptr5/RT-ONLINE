import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class BottomSheetIuran extends StatelessWidget {
  const BottomSheetIuran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //FLEXIBLE PERTAMA
                Flexible(
                  child: Text(
                    '11 Okt 22',
                    style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
                Flexible(
                  child: Text(
                    '14:00',
                    style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
                30.verticalSpace,
                //FLEXIBLE KEDUA
                Flexible(
                  child: Text(
                    '10 Okt 22',
                    style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
                Flexible(
                  child: Text(
                    '14:00',
                    style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
                30.verticalSpace,
                //FLEXIBLE 3
                Flexible(
                  child: Text(
                    '9 Okt 22',
                    style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
                Flexible(
                  child: Text(
                    '14:00',
                    style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
                30.verticalSpace,
                //FLEXIBLE 4
                Flexible(
                  child: Text(
                    '8 Okt 22',
                    style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
                Flexible(
                  child: Text(
                    '14:00',
                    style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
                30.verticalSpace,
                //FLEXIBLE 5
                Flexible(
                  child: Text(
                    '7 Okt 22',
                    style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
                Flexible(
                  child: Text(
                    '14:00',
                    style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 255, 255, 255), // Warna latar belakang container
                  shape: BoxShape.circle, // Bentuk container menjadi lingkaran
                  border: Border.all(
                    color: Colors.black, // Warna border
                    width: 1.5, // Ketebalan border
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/edit.png',
                    height: 30,
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                height: 25,
                width: 1,
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 255, 255, 255), // Warna latar belakang container
                  shape: BoxShape.circle, // Bentuk container menjadi lingkaran
                  border: Border.all(
                    color: Colors.black, // Warna border
                    width: 1.5, // Ketebalan border
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/edit.png',
                    height: 30,
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                height: 25,
                width: 1,
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 255, 255, 255), // Warna latar belakang container
                  shape: BoxShape.circle, // Bentuk container menjadi lingkaran
                  border: Border.all(
                    color: Colors.black, // Warna border
                    width: 1.5, // Ketebalan border
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/edit.png',
                    height: 30,
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                height: 25,
                width: 1,
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 255, 255, 255), // Warna latar belakang container
                  shape: BoxShape.circle, // Bentuk container menjadi lingkaran
                  border: Border.all(
                    color: Colors.black, // Warna border
                    width: 1.5, // Ketebalan border
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/edit.png',
                    height: 30,
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                height: 25,
                width: 1,
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 255, 255, 255), // Warna latar belakang container
                  shape: BoxShape.circle, // Bentuk container menjadi lingkaran
                  border: Border.all(
                    color: Colors.black, // Warna border
                    width: 1.5, // Ketebalan border
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/file.png',
                    height: 30,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),

          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                Text(
                  "Diubah Oleh Krisna Maulana",
                  style: NunitoTextStyle.fw700.copyWith(fontSize: 17),
                ),
                45.verticalSpace,
                Text(
                  "Diubah Oleh Krisna Maulana",
                  style: NunitoTextStyle.fw700.copyWith(fontSize: 17),
                ),
                40.verticalSpace,
                Flexible(
                  child: Text(
                    'Diubah Oleh Krisna Maulana',
                    style: NunitoTextStyle.fw700.copyWith(fontSize: 17),
                  ),
                ),
                Flexible(
                  child: Text(
                    'Penyusutan Iuran Rp 50.000',
                    style: NunitoTextStyle.fw600.copyWith(fontSize: 14),
                  ),
                ),
                20.verticalSpace,
                Flexible(
                  child: Text(
                    'Diubah Oleh Krisna Maulana',
                    style: NunitoTextStyle.fw700.copyWith(fontSize: 17),
                  ),
                ),
                Flexible(
                  child: Text(
                    'Kenaikan Iuran Rp 150.000',
                    style: NunitoTextStyle.fw600.copyWith(fontSize: 14),
                  ),
                ),
                40.verticalSpace,
                Text(
                  "Dibuat Oleh Krisna Maulana",
                  style: NunitoTextStyle.fw700.copyWith(fontSize: 17),
                ),
              ],
            ),
          )
          // Tambahkan widget di sini sesuai kebutuhan
        ],
      ),
    );
  }
}
