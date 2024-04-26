import 'package:flutter/material.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class NominalField extends StatelessWidget {
  final TextEditingController controller; // Tambahkan controller di sini

  // Konstruktor dengan parameter controller
  const NominalField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            width: 40, // Adjust the width as needed
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF094282),
            ),
            child: Center(
              child: Text(
                'Rp',
                style: TextStyle(
                  fontFamily: 'NunitoBold',
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          SizedBox(width: 10), // Spacer
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 5),
              child: TextField(
                controller:
                    controller, // Gunakan controller yang diterima dari luar
                style: NunitoTextStyle.fw600.copyWith(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
