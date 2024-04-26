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
import 'package:venturo_core/features/uang_masuk/view/components/top_bar_pemasukan.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DetailPemasukanUangKeluarScreen extends StatelessWidget {
  const DetailPemasukanUangKeluarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Demo Controller

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Topbar
            const TopBarPemasukan2(
              title: "Detail Pemasukan",
            ),
            23.verticalSpace,

            // TextField

            TextFieldPengeluaran(
              label: "Keterangan Pengeluaran",
              hint: "Pembangunan",
            ),

            20.verticalSpace,

            TextFieldPengeluaran(
              hint: "2 Okt 2024 09:00",
              label: "Tanggal",
            ),

            20.verticalSpace,
            Transform.translate(
              offset: Offset(-100, 0),
              child: Text(
                "Detail Pengeluaran",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 16),
              ),
            ),
            10.verticalSpace,
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
