import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_dashboard/view/ui/admin_dashboard_screen.dart';
import 'package:venturo_core/features/dashboard/view/ui/dashboard_screen.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

TextEditingController handphoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
void login(String phone_number, String password) async {
  try {
    Response response = await post(
      Uri.parse('https://rtonline-api.venturo.pro/api/v1/auth/login'),
      body: {'phone_number': phone_number, 'password': password},
    );
    if (response.statusCode == 200 &&
        passwordController.text.isNotEmpty &&
        handphoneController.text.isNotEmpty) {
      // Login berhasil
      print('Login Berhasil');
      Get.to(AdminDashboardScreen());
    } else {
      // Login gagal
      Get.snackbar("Error", "Login Gagal");
    }
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}

class _SignInScreenState extends State<SignInScreen> {
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
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No. Handphone",
                    style: NunitoTextStyle.fw800.copyWith(fontSize: 16),
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
                      controller: handphoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Masukan No. Handphone',
                        hintStyle: NunitoTextStyle.fw400,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    "Password",
                    style: NunitoTextStyle.fw800.copyWith(fontSize: 16),
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
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Masukan Password',
                        hintStyle: NunitoTextStyle.fw400,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
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
              login(handphoneController.text.toString(),
                  passwordController.text.toString());
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
                Positioned(child: Image.asset('assets/images/Gram.png'))
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
                Positioned(child: Image.asset('assets/images/Text.png'))
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
