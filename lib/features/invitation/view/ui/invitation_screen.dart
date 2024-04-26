// invite_view.dart

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_dashboard/view/ui/admin_dashboard_screen.dart';
import 'package:venturo_core/features/sign_in/view/ui/sign_in_screen.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class InviteView extends StatefulWidget {
  InviteView({Key? key}) : super(key: key);

  @override
  _InviteViewState createState() => _InviteViewState();
}

TextEditingController nameController = TextEditingController();

TextEditingController handphoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
void invitation(String phone_number, String password) async {
  try {
    // Remove any non-numeric characters from the phone number

    String url = 'https://wa.me/$phone_number?text=$password';
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}

class _InviteViewState extends State<InviteView> {
  var phone = '';
  var passMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 230,
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
                  Center(
                    child: Container(
                      width: 170,
                      height: 190,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 134,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/udeng.jpeg'),
                                fit: BoxFit.fill,
                              ),
                              shape: CircleBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Nama",
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
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Masukan Nama',
                        hintStyle: NunitoTextStyle.fw400,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  10.verticalSpace,
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
                    "Email",
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
                      decoration: InputDecoration(
                        hintText: 'Masukan Email',
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
                  SizedBox(height: 20),
                  buildJoinButton(),
                ],
              ),
            ),
            50.verticalSpace,
            buildPlatformByContainer(),
          ],
        ),
      ),
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
              invitation(
                handphoneController.text.toString(),
                passwordController.text.toString(),
              );
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
                    child: Image.asset('assets/images/Gram.png'),
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
                    child: Image.asset('assets/images/Text.png'),
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
