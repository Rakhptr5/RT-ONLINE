// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/features/kategori_iuran/view/components/admin_informasi_bottomsheet.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class KategoriIuranCard2 extends StatelessWidget {
  const KategoriIuranCard2({
    Key? key,
    this.note,
    required this.bulan,
  }) : super(key: key);

  final String? note;
  final String bulan;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return KategoriIuranBottomsheet();
          },
        );
      },
      child: Stack(
        children: [
          // Card
          Container(
            margin: EdgeInsets.only(top: 25.w, bottom: 15.w),
            width: 382.w,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Column(
              children: [
                12.verticalSpace,

                // Saldo Awal
                buildContent(title: "Iuran Kebersihan", nominal: 150000),

                // Pemasukan
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.w),
                  child:
                      buildContent(title: "Iuran Perawatan", nominal: 150000),
                ),

                // Pengeluaran
                buildContent(title: "Iuran Keamanan", nominal: 100000),

                12.verticalSpace,

                const Divider(
                  color: Color(0xffB5B7C4),
                ),

                16.verticalSpace,

                // Saldo Kas Saat ini
                buildSaldoNow(nominal: 400000),

                // Note
              ],
            ),
          ),

          // Container
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 120.w,
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.w),
                decoration: ShapeDecoration(
                  color: const Color(0xFF6454F0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                // Text
                child: Text(
                  textAlign: TextAlign.center,
                  'bulan',
                  style: NunitoTextStyle.fw600.copyWith(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildSaldoNow({int? nominal}) {
    return Column(
      children: [
        Row(
          children: [
            // Text
            Text(
              'Total Iuran',
              style: NunitoTextStyle.fw600.copyWith(
                color: const Color(0xFF221A8B),
                fontSize: 16.sp,
              ),
            ),

            Expanded(child: Container()),

            // Text Nominal
            Text(
              NumberFormat.currency(
                      locale: "id", decimalDigits: 0, symbol: "Rp ")
                  .format((nominal != null) ? nominal : 0),
              style: NunitoTextStyle.fw600.copyWith(
                color: const Color(0xFF221A8B),
                fontSize: 16.sp,
              ),
            ),
          ],
        ),

        //Container Biru
        20.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 188.0),
          child: Row(
            children: [
              Container(
                width: 110,
                height: 33,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  color: Color(0xFF094282),
                ),
                child: Center(
                  child: Row(
                    children: [
                      9.horizontalSpace,
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 15,
                      ),
                      10.horizontalSpace,
                      Text(
                        "Edit Iuran",
                        style: NunitoTextStyle.fw600
                            .copyWith(fontSize: 14.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              5.horizontalSpace,
              Icon(
                Icons.update,
                size: 25,
              )
            ],
          ),
        ),
      ],
    );
  }

  Row buildContent({required String title, int? nominal}) {
    return Row(
      children: [
        // Text
        Text(
          title,
          style: NunitoTextStyle.fw400.copyWith(
            color: const Color(0xFF0B0C0D),
            fontSize: 14.sp,
          ),
        ),

        Expanded(child: Container()),

        // Text Nominal
        Text(
          NumberFormat.currency(locale: "id", decimalDigits: 0, symbol: "Rp ")
              .format((nominal != null) ? nominal : 0),
          style: NunitoTextStyle.fw800.copyWith(
            color: const Color(0xFF0B0C0D),
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
