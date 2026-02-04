import 'package:digiations_nexa/features/employee_tabs/presentation/views/tabs/control/widgets/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  List<DateTime> allDates = [];
  List<DateTime> filteredDates = [];

  late String selectedMonth;

  final List<String> months = [
    "All time",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  @override
  void initState() {
    super.initState();

    final today = DateTime.now();

    allDates = List.generate(60, (i) => today.add(Duration(days: i)));

    selectedMonth = DateFormat('MMMM').format(today);

    filterByMonth(selectedMonth);
  }

  void filterByMonth(String month) {
    if (month == "All time") {
      filteredDates = List.from(allDates);
    } else {
      final monthNumber = months.indexOf(month);
      filteredDates =
          allDates.where((d) => d.month == monthNumber).toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DropdownButtonHideUnderline(
            child:
            buildMonthFilter(),

          ),

          const SizedBox(height: 16),

          Expanded(
            child: ListView.builder(
              itemCount: filteredDates.length,
              itemBuilder: (_, i) {
                final date = filteredDates[i];

                return ExpansionTile(
                  tilePadding: const EdgeInsets.symmetric(horizontal: 0),
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 0),
                  title: Text(
                    DateFormat('EEEE, dd MMM yyyy').format(date),
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing:
                  const Icon(Icons.keyboard_arrow_down_rounded),
                  children: [
                    _dayTimeline(date),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _dayTimeline(DateTime date) {
    const int startHour = 9;
    const int hoursPerDay = 8;

    final entries = List.generate(hoursPerDay, (i) {
      return TimelineEntry(
        DateTime(date.year, date.month, date.day, startHour + i),
      );
    });

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: entries.length,
      itemBuilder: (_, i) {
        final e = entries[i];

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "${e.dateTime.hour}:00 - ${e.dateTime.hour + 1}:00",
              style:
              GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: e.task,
                      decoration: const InputDecoration(
                        hintText: "Task",
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: e.message,
                      decoration: const InputDecoration(
                        hintText: "Message",
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: e.project,
                      decoration: const InputDecoration(
                        hintText: "Project",
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget buildMonthFilter() {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.9, end: 1),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          alignment: Alignment.centerLeft,
          child: child,
        );
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.2,
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 4,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child:
            DropdownButton(
              isDense: true,
              isExpanded: false,
              value: selectedMonth,
              icon: Padding(
                padding: const EdgeInsets.only(left: 19),
                child: const Icon(Icons.keyboard_arrow_down_rounded),
              ),
              iconSize: 25,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              borderRadius: BorderRadius.circular(14),
              items: months.map((m) {
                return DropdownMenuItem(
                  value: m,
                  child: Text(m),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMonth = value!;
                  filterByMonth(selectedMonth);
                });
              },
            )

          ),
        ),
      ),
    );
  }


}
