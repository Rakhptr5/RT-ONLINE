import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class ButtonImages extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const ButtonImages({
    Key? key,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          width: 100, // Sesuaikan dengan ukuran yang diinginkan
          height: 100, // Sesuaikan dengan ukuran yang diinginkan
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  Colors.blue, // Sesuaikan dengan warna border yang diinginkan
              width: 2.0, // Sesuaikan dengan lebar border yang diinginkan
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/imagus.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
