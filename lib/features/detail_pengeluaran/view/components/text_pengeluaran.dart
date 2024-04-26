import 'package:flutter/material.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TextPengeluaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Row(
        children: [
          Text("Total Pengeluaran",
              style: NunitoTextStyle.fw700.copyWith(fontSize: 16)),
          SizedBox(width: 86), // Spacer antara dua teks
          Text("Rp 2.000.000",
              style: NunitoTextStyle.fw800.copyWith(fontSize: 24)),
        ],
      ),
    );
  }
}
