import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class FilterTanggalUangKeluar extends StatefulWidget {
  const FilterTanggalUangKeluar({super.key});

  @override
  State<FilterTanggalUangKeluar> createState() =>
      _FilterTanggalUangKeluarState();
}

class _FilterTanggalUangKeluarState extends State<FilterTanggalUangKeluar> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10))), // warna kontainer putih
                    height: 510, // ubah tinggi sesuai kebutuhan Anda
                    width: 390 // ubah lebar sesuai kebutuhan Anda
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40.0, right: 40.0, bottom: 40.0, top: 10),
                child: TableCalendar(
                  headerStyle: HeaderStyle(
                      titleTextStyle:
                          NunitoTextStyle.fw800.copyWith(fontSize: 20),
                      formatButtonVisible: false,
                      titleCentered: true),
                  rowHeight: 70,
                  availableGestures: AvailableGestures.all,
                  focusedDay: today,
                  onDaySelected: _onDaySelected,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2040, 10, 16),
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: NunitoTextStyle.fw800,
                    weekendTextStyle:
                        NunitoTextStyle.fw800.copyWith(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
