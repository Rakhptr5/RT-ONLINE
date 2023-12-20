import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 33,
                          backgroundImage: AssetImage('assets/udeng.jpeg'),
                        ),
                        SizedBox(width: 16),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 8, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Krisna Maulana',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: 'PoppinsSemi',
                                ),
                              ),
                              Text(
                                'Perumahan Griya Shanta C-23',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'PoppinsSemi',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 140,
                  left: 20,
                  right: 20,
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(13, 9, 0, 0),
                              child: Text(
                                'Saldo Kas RT',
                                style: TextStyle(
                                  color: Color(0xFF1F1F1F),
                                  fontSize: 14,
                                  fontFamily: 'NunitoBold',
                                  height: 0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(13, 4, 0, 0),
                              child: Text(
                                'Rp.10.000.000',
                                style: TextStyle(
                                  color: Color(0xFF1F1F1F),
                                  fontSize: 22,
                                  fontFamily: 'NunitoExt',
                                  height: 0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // Add the action for the button here
                            print('Button Lihat Ditekan!');
                          },
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 35, left: 25),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFF6EE2F5),
                                      Color(0xFF6454F0)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 17,
                                  vertical: 2,
                                ),
                                child: Text(
                                  'Lihat',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'NunitoExt',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/Vector.png',
                                    width: 15,
                                    height: 60,
                                    color:
                                        ui.Color.fromARGB(255, 111, 111, 111),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Jumlah Rumah',
                                        style: TextStyle(
                                          color: Color(0xFF1F1F1F),
                                          fontSize: 12,
                                          fontFamily: 'NunitoExt',
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 7),
                                        child: Text(
                                          '50',
                                          style: TextStyle(
                                            color: Color(0xFF1F1F1F),
                                            fontSize: 22,
                                            fontFamily: 'NunitoExt',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 200,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: [
                Image.asset('assets/Frame.png'),
                Image.asset('assets/Frame.png'),
                Image.asset('assets/Frame.png'),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
