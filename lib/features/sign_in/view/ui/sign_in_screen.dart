// auth_view.dart

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key});

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
            SizedBox(height: 35),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextField('No. Handphone', TextInputType.phone),
                  SizedBox(height: 10),
                  buildTextField('Password', TextInputType.visiblePassword,
                      isPassword: true),
                  SizedBox(height: 8),
                  buildForgotPassword(),
                  SizedBox(height: 20),
                  buildLoginButton(),
                ],
              ),
            ),
            SizedBox(height: 170),
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

  Widget buildForgotPassword() {
    return GestureDetector(
      onTap: () {
        // Navigate to the forgot password page
        Get.toNamed(Routes.forgotPassRoute);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(right: 20),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Lupa Password ?',
            style: TextStyle(
              color: Color(0xFF6454F0),
              fontSize: 12,
              fontFamily: 'NunitoBold',
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
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
              Get.toNamed(Routes.dashboardRoute);
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
                  'Login',
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
      width: 201,
      height: 62,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(80, 0.5, 8, 20),
            child: Text(
              'Platform By',
              style: TextStyle(
                color: Color(0xFFB5B7C4),
                fontSize: 8,
                fontFamily: 'NunitoSem',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 44,
            top: 16,
            child: Container(
              width: 30,
              height: 30,
              child: Stack(children: [
                Positioned(child: Image.asset('assets/Gram.png'))
              ]),
            ),
          ),
          Positioned(
            left: 90,
            top: 26.50,
            child: Container(
              width: 66,
              height: 9,
              child: Stack(children: [
                Positioned(child: Image.asset('assets/Text.png'))
              ]),
            ),
          ),
          Positioned(
            left: 6,
            top: 51,
            child: Text(
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
          ),
        ],
      ),
    );
  }
}
