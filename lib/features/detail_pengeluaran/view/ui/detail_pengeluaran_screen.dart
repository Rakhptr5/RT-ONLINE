import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/detail_pemasukan/view/components/text_field_laporan.dart';
import 'package:venturo_core/features/detail_pemasukan/view/components/text_field_pemasukan.dart';
import 'package:venturo_core/features/detail_pengeluaran/view/components/image_field.dart';
import 'package:venturo_core/features/detail_pengeluaran/view/components/text_field_pengeluaran.dart';
import 'package:venturo_core/features/detail_pengeluaran/view/components/text_pengeluaran.dart';
import 'package:venturo_core/features/detail_pengeluaran/view/components/top_bar_pengeluaran.dart';
import 'package:venturo_core/features/profile/view/components/bottom_sheet_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/button_gradient_profile.dart';
import 'package:venturo_core/features/profile/view/components/drop_down_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/profile_card.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/top_bar_profile.dart';

class DetailPengeluaranScreen extends StatelessWidget {
  const DetailPengeluaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Demo Controller

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Topbar
            const TopBarPengeluaran(title: "Detail Pengeluaran"),

            23.verticalSpace,

            // TextField

            TextFieldPengeluaran(
              label: "Jenis Pengeluaran",
              hint: "Pembangunan",
            ),

            20.verticalSpace,

            TextFieldPengeluaran(
              hint: "2 Okt 2024 09:00",
              label: "Tanggal",
            ),

            20.verticalSpace,

            const TextFieldPengeluaran(
              hint: "Mushola",
              label: "Keterangan",
            ),

            20.verticalSpace,
            ImageField(),
            20.verticalSpace,
            ImageField(),
            15.verticalSpace,
            TextPengeluaran(),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
