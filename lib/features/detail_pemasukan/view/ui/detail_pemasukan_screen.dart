import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/detail_pemasukan/view/components/text_field_laporan.dart';
import 'package:venturo_core/features/detail_pemasukan/view/components/text_field_pemasukan.dart';
import 'package:venturo_core/features/profile/view/components/bottom_sheet_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/button_gradient_profile.dart';
import 'package:venturo_core/features/profile/view/components/drop_down_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/profile_card.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/top_bar_profile.dart';

import '../components/top_bar_pemasukan.dart';

class DetailPemasukanScreen extends StatelessWidget {
  const DetailPemasukanScreen({super.key});

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
            const TopBarPemasukan(title: "Detail Pemasukan"),

            23.verticalSpace,

            // TextField
            // No. KK
            TextFieldLaporan(
              label: "Masukkan Nama",
              hint: "Nama",
              textInputType: TextInputType.number,
              onTap: () {},
            ),

            20.verticalSpace,

            // NIK
            TextFieldLaporan(
              hint: "Jenis ",
              label: "Jenis Pemasukan",
              textInputType: TextInputType.number,
              onTap: () {},
            ),

            20.verticalSpace,

            // Pekerjaan
            const TextFieldLaporan(
              hint: "Masukkan Nominal",
              label: "Nominal",
              textInputType: TextInputType.text,
            ),

            20.verticalSpace,

            // Agama
            // Tempat tanggal lahir
            TextFieldEditProfile(
              controller: controller,
              hint: 'Masukkan Tanggal',
              icon: "assets/images/ic_calendar.png",
              label: "Tanggal",
              textInputType: TextInputType.text,
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );

                if (selectedDate != null) {
                  controller.text =
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                }
              },
            ),

            20.verticalSpace,

            const TextFieldLaporan(
              hint: "Masukkan Nama Penerima",
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
