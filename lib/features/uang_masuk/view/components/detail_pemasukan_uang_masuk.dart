import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/detail_pemasukan/view/components/text_field_laporan.dart';
import 'package:venturo_core/features/detail_pemasukan/view/components/text_field_pemasukan.dart';
import 'package:venturo_core/features/detail_pemasukan/view/components/top_bar_pemasukan.dart';
import 'package:venturo_core/features/profile/view/components/bottom_sheet_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/button_gradient_profile.dart';
import 'package:venturo_core/features/profile/view/components/drop_down_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/profile_card.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/top_bar_profile.dart';
import 'package:venturo_core/features/uang_masuk/view/components/text_field_laporan.dart';
import 'package:venturo_core/features/uang_masuk/view/components/top_bar_pemasukan.dart';

class DetailPemasukanUangMasukScreen extends StatelessWidget {
  const DetailPemasukanUangMasukScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Demo Controller
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Topbar
            const TopBarPemasukan2(title: "Detail Pemasukan"),

            23.verticalSpace,

            // TextField
            // No. KK
            TextFieldUangMasuk(
              label: "Masukkan Nama",
              hint: "Ahmad Sujadi",
              onTap: () {},
            ),

            20.verticalSpace,

            // NIK
            TextFieldUangMasuk(
              hint: "Jenis ",
              label: "Iuran",
              textInputType: TextInputType.number,
              onTap: () {},
            ),

            20.verticalSpace,

            // Pekerjaan
            const TextFieldUangMasuk(
              hint: "Rp. 1.000.000",
              label: "Nominal",
              textInputType: TextInputType.text,
            ),

            20.verticalSpace,

            const TextFieldUangMasuk(
              hint: "Senin, 30 Okt 2023, 09:00",
              label: "Tanggal",
              textInputType: TextInputType.text,
            ),

            20.verticalSpace,

            const TextFieldUangMasuk(
              hint: "Abdullah",
              label: "Diterima Oleh",
              textInputType: TextInputType.text,
            ),
            20.verticalSpace,

            const TextFieldPemasukan(
              label: "Bukti",
            ),

            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
