// invite_view.dart

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';

class InviteView extends StatelessWidget {
  const InviteView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
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
            SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Tambahkan widget untuk foto dan label C-23 di atas widget Nama
                  Container(
                    width: 170,
                    height: 170,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 134,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/udeng.jpeg'),
                              fit: BoxFit.fill,
                            ),
                            shape: CircleBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2),
                  buildTextField('Nama', TextInputType.text),
                  SizedBox(height: 10),
                  buildTextField('No. Handphone', TextInputType.phone),
                  SizedBox(height: 10),
                  buildTextField('Password', TextInputType.visiblePassword,
                      isPassword: true),
                  SizedBox(height: 20),
                  buildJoinButton(),
                ],
              ),
            ),
            buildPlatformByContainer(),
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
                hintText: isPassword ? 'Masukkan Password' : 'Masukkan $label',
                hintStyle: TextStyle(
                  fontFamily: 'NunitoReg',
                  color: Color.fromARGB(255, 170, 170, 170),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 2),
                suffixIcon: isPassword
                    ? Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.visibility_off_outlined),
                      )
                    : null,
                suffixIconConstraints: BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildJoinButton() {
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
            splashColor:
                Color(0xFF6454F0), // Set a distinct color for the splash effect
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 54,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 0.5),
              child: Center(
                child: Text(
                  'Join',
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
    return Container(
      width: double.infinity,
      height: 62,
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            child: Text(
              'Platform By',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6454F0),
                fontSize: 8,
                fontFamily: 'NunitoSem',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 80,
            top: 19,
            child: Container(
              width: 30,
              height: 30,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: Image.asset('assets/Gram.png'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 40,
            right: 0,
            top: 30,
            child: Container(
              width: 66,
              height: 9,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: Image.asset('assets/Text.png'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 53,
            child: Text(
              'RT BERKUALITAS, PENGURUS BERKELAS',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6454F0),
                fontSize: 7,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: 1.40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
