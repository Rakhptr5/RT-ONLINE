import 'package:flutter/material.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TatibCard extends StatelessWidget {
  final String categoriesName;
  final String description;

  const TatibCard({
    Key? key,
    required this.categoriesName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TEXT PERTAMA(1)
        Text(
          categoriesName,
          style: NunitoTextStyle.fw700.copyWith(fontSize: 18),
        ),
        // TEXT KEDUA (2)
        Divider(),
        Text(
          description,
          style: NunitoTextStyle.fw600.copyWith(fontSize: 13),
        ),
      ],
    );
  }
}
