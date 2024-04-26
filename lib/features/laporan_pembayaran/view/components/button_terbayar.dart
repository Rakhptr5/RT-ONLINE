import 'package:flutter/material.dart';

class ButtonTerbayar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 180.0),
      child: Container(
        width: 100,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFF27D18A),
        ),
        child: Center(
          child: Text(
            'Terbayarkan',
            style: TextStyle(color: Colors.white, fontSize: 11),
          ),
        ),
      ),
    );
  }
}
