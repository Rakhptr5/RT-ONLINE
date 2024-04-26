import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/profile/view/components/bottom_sheet_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/button_gradient_profile.dart';
import 'package:venturo_core/features/profile/view/components/drop_down_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/profile_card.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/top_bar_profile.dart';
import 'package:venturo_core/features/undang_warga/view/components/drop_down_hak_akses.dart';
import 'package:venturo_core/features/undang_warga/view/components/drop_down_nomor_rumah%20copy.dart';
import 'package:venturo_core/features/undang_warga/view/components/drop_down_nomor_rumah.dart';
import 'package:venturo_core/features/undang_warga/view/components/profile_card_admin.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class UndangWargaScreen extends StatefulWidget {
  const UndangWargaScreen({super.key});

  @override
  _UndangWargaScreenState createState() => _UndangWargaScreenState();
}

class _UndangWargaScreenState extends State<UndangWargaScreen> {
  // Demo Controller
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  // Boolean variable to track checkbox state
  bool isInvitationChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Topbar
            const TopBarProfile(title: "Profile"),

            32.verticalSpace,

            // Profile Card
            const ProfileCardAdmin(
              isEdit: true,
            ),

            43.verticalSpace,

            // TextField
            const TextFieldEditProfile(
              hint: "Masukkan Pekerjaan",
              label: "Nama",
              textInputType: TextInputType.text,
            ),

            20.verticalSpace,

            // NIK
            TextFieldEditProfile(
              hint: "Masukkan NIK",
              icon: "assets/images/ic_image.png",
              label: "NIK",
              textInputType: TextInputType.number,
              onTap: () {
                showBottomSheetEdit(
                  context,
                  label: "NIK",
                  hint: "Masukkan NIK",
                  textInputType: TextInputType.number,
                  text: "Foto NIK",
                );
              },
            ),
            20.verticalSpace,

            // No. KK
            TextFieldEditProfile(
              label: "No. KK",
              hint: "Masukkan No. KK",
              textInputType: TextInputType.number,
              icon: "assets/images/ic_image.png",
              onTap: () {
                showBottomSheetEdit(
                  context,
                  label: "No. KK",
                  hint: "Masukkan No. KK",
                  textInputType: TextInputType.number,
                  text: "Foto KK",
                );
              },
            ),
            20.verticalSpace,

            // No. Handphone
            const TextFieldEditProfile(
              hint: "Masukkan No. Handphone",
              label: "No. Handphone",
              textInputType: TextInputType.phone,
            ),

            20.verticalSpace,

            DropDownNomorRumah(
              hint: "Masukkan Blok & No. Rumah",
              label: "Blok - Nomor Rumah",
              icon: "assets/images/ic_arrow_ios_down.png",
              textInputType: TextInputType.text,
              controller: controller2,
            ),

            20.verticalSpace,

            DropDownIuran(
              hint: "Masukkan Iuran",
              label: "Iuran Warga",
              icon: "assets/images/ic_arrow_ios_down.png",
              textInputType: TextInputType.text,
              controller: controller2,
            ),

            20.verticalSpace,

            // Jenis Kelamin
            DropDownEditProfile(
              hint: "Masukkan Jenis Kelamin",
              label: "Jenis Kelamin",
              icon: "assets/images/ic_arrow_ios_down.png",
              textInputType: TextInputType.text,
              controller: controller2,
            ),

            20.verticalSpace,

            // Tempat tanggal lahir
            TextFieldEditProfile(
              controller: controller,
              hint: 'Masukkan Tempat, Tanggal Lahir',
              icon: "assets/images/ic_calendar.png",
              label: "Tempat, Tanggal Lahir",
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
            // Agama
            const TextFieldEditProfile(
              hint: "Masukkan Agama",
              label: "Agama",
              textInputType: TextInputType.text,
            ),
            20.verticalSpace,
            // Agama
            const TextFieldEditProfile(
                hint: "Masukkan Password",
                label: "Password",
                textInputType: TextInputType.text,
                isObscure: true),
            20.verticalSpace,
            DropDownHakAkses(
              hint: "Pilih Hak Akses",
              label: "Hak Akses",
              icon: "assets/images/ic_arrow_ios_down.png",
              textInputType: TextInputType.text,
              controller: controller2,
            ),

            // Checkbox
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isInvitationChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        // Update the state of the checkbox
                        isInvitationChecked = value ?? false;
                      });
                    },
                  ),
                  Text(
                      'Kirim Invitation', // Replace with your own checkbox label
                      style: NunitoTextStyle.fw700.copyWith(fontSize: 16.sp)),
                ],
              ),
            ),

            10.verticalSpace,
            // Button Simpan
            ButtonGradientProfile(
              text: "Simpan",
              onPressed: () {},
            ),

            15.verticalSpace
          ],
        ),
      ),
    );
  }

  Future<dynamic> showBottomSheetEdit(
    BuildContext context, {
    required String label,
    required String hint,
    required TextInputType textInputType,
    String? text,
  }) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        double sheetHeight = 370.w;
        return SizedBox(
          height: MediaQuery.of(context).viewInsets.bottom + sheetHeight,
          child: BottomSheetEditProfile(
            label: label,
            hint: "Masukkan No. KK",
            textInputType: TextInputType.number,
            icon: "assets/images/ic_edit.png",
            text: (text != null) ? text : "null",
          ),
        );
      },
    );
  }
}
