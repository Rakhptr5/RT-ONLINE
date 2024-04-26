import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class FilterTanggal extends StatefulWidget {
  const FilterTanggal({super.key});

  @override
  State<FilterTanggal> createState() => _FilterTanggalState();
}

class _FilterTanggalState extends State<FilterTanggal> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TableCalendar(
            headerStyle: HeaderStyle(
                titleTextStyle: NunitoTextStyle.fw800.copyWith(fontSize: 16),
                formatButtonVisible: false,
                titleCentered: true),
            rowHeight: 70,
            availableGestures: AvailableGestures.all,
            focusedDay: today,
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day) => isSameDay(day, today),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2040, 10, 16),
            calendarStyle:
                CalendarStyle(weekendTextStyle: TextStyle(color: Colors.red)),
          ),
        )
      ],
    );
  }
}
