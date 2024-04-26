import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:venturo_core/features/detail_pemasukan/view/components/bukti_page.dart';

class ButtonImagesPemasukan extends StatelessWidget {
  const ButtonImagesPemasukan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BuktiPage());
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Center(
          child: Stack(
            // Menggunakan Stack di sini
            children: [
              Container(
                width: 360, // Sesuaikan dengan ukuran yang diinginkan
                height: 110, // Sesuaikan dengan ukuran yang diinginkan
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('assets/images/bukti.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Tambahkan elemen lain di sini jika diperlukan
              Positioned(
                left: 155,
                top: 30,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 9, 65, 130),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Positioned(
                  left: 157,
                  top: 33,
                  child: Image.asset(
                    'assets/images/eye.png',
                    width: 35,
                    height: 35,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
