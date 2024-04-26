// auth_view.dart

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/routes/route.dart';

class NewPassView extends StatelessWidget {
  const NewPassView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 290,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-1.3, -1),
                  end: Alignment(1, 0.44),
                  colors: [Color(0xFF6EE2F5), Color(0xFF6454F0)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 8,
                    offset: Offset(4, 3),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PERUM BUMI PALAPA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'PoppinsSemi',
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'RT 01',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'PoppinsBold',
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Mojolangu, Lowokwaru, Malang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'NunitoBold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Masukkan Password Baru',
                        style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontSize: 20,
                          fontFamily: 'PoppinsBold',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  buildTextField('Password Baru', TextInputType.visiblePassword,
                      isPassword: true),
                  SizedBox(height: 20),
                  buildTextField(
                      'Konfirmasi Password Baru', TextInputType.visiblePassword,
                      isPassword: true),
                  SizedBox(height: 20),
                  buildSaveButton(),
                  SizedBox(height: 140), // Add some spacing
                  buildPlatformByContainer(),
                  SizedBox(height: 10), // Increase the spacing to move it down
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextInputType keyboardType,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 8, 1),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'NunitoBold',
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 8,
                offset: Offset(4, 3),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(14, 0.5, 0.5, 0.5),
            child: TextField(
              keyboardType: keyboardType,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: 'Masukkan $label',
                hintStyle: TextStyle(
                  fontFamily: 'NunitoReg',
                  color: Color.fromARGB(255, 170, 170, 170),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    vertical: 15), // Adjust content padding
                suffixIcon: isPassword ? Icon(Icons.visibility) : null,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSaveButton() {
    return Material(
      child: Container(
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF6EE2F5), Color(0xFF6454F0)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.signInRoute);
            },
            splashColor: Color(0xFF6454F0),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 54,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 0.5),
              child: Center(
                child: Text(
                  'Simpan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'NunitoBold',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPlatformByContainer() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Platform By',
            style: TextStyle(
              color: Color(0xFF6454F0),
              fontSize: 8,
              fontFamily: 'NunitoSem',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Gram.png', width: 30, height: 30),
              SizedBox(width: 10),
              Image.asset('assets/images/Text.png', width: 66, height: 9),
            ],
          ),
          SizedBox(height: 5),
          Text(
            'RT BERKUALITAS, PENGURUS BERKELAS',
            style: TextStyle(
              color: Color(0xFF6454F0),
              fontSize: 7,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: 1.40,
            ),
          ),
        ],
      ),
    );
  }
}
