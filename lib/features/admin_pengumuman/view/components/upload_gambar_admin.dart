import 'package:flutter/material.dart';

class UploadGambarAdmin extends StatelessWidget {
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
          ElevatedButton(
            onPressed: () {
              // Implement your button action here
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF094282), // Set the button color to blue
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Choose File',
              style: TextStyle(
                fontFamily: 'NunitoBold',
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
          SizedBox(width: 10), // Spacer
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'Upload Gambar Disini',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                    fontFamily: 'NunitoReg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
