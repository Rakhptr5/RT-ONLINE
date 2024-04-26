// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ContainerRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Container Hijau
        Container(
          width: 174.0,
          height: 82.0,
          decoration: BoxDecoration(
            color: const Color(0xFF27D18A),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: // Icon di sini
                  [
                Padding(
                  padding: EdgeInsets.only(bottom: 30, left: 10),
                  child: ImageIcon(
                    AssetImage('assets/images/checkmark.png'),
                    color: Colors.white,
                  ),
                ),

                SizedBox(width: 8.0), // Spasi antara ikon dan teks
                // Teks dan informasi lainnya
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sudah Terbayar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                        fontFamily: ("NunitoReg"),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Rp.5.000.000',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontFamily: ("NunitoBold")),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '7 warga',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontFamily: ("NunitoSemiBold")),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 174.0,
          height: 82.0,
          decoration: BoxDecoration(
            color: const Color(0xFFD40202),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: // Icon di sini
                  [
                Padding(
                  padding: EdgeInsets.only(bottom: 30, left: 10),
                  child: ImageIcon(
                    AssetImage('assets/images/cross.png'),
                    color: Colors.white,
                  ),
                ),

                SizedBox(width: 8.0), // Spasi antara ikon dan teks
                // Teks dan informasi lainnya
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Belum Terbayar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                        fontFamily: ("NunitoReg"),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Rp.1.000.000',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontFamily: ("NunitoBold")),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '3 warga',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontFamily: ("NunitoSemiBold")),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
