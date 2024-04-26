import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class BuktiPage extends StatefulWidget {
  BuktiPage({super.key});

  @override
  State<BuktiPage> createState() => _BuktiPageState();
}

class _BuktiPageState extends State<BuktiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          PhotoView(imageProvider: AssetImage('assets/images/pembayaran.jpg')),
    );
  }
}
