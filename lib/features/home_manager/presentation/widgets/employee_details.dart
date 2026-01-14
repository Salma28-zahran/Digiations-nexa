import 'package:digiations_nexa/features/home_employee/presentation/widgets/model.dart'
    show TimelineEntry;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'custom_appbar.dart';

class EmployeeDetails extends StatefulWidget {
  const EmployeeDetails({super.key});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  final List<TimelineEntry> _entries = [];
  final ScrollController _verticalController = ScrollController();
  final ScrollController _horizontalController = ScrollController();

  bool _loading = false;

  static const int startHour = 9;
  static const int hoursPerDay = 8;

  static const Color blue = Color(0xFF2FA4FF);
  static const Color purple = Color(0xFF7A5CFF);
  static const Color pink = Color(0xFFFF4FD8);

  static const Color background = Color(0xFFF4F6FF);
  static const Color rowLight = Color(0xFFFFFFFF);
  static const Color rowDark = Color(0xFFF0F2FF);
  static const Color borderColor = Color(0xFFDDD7FF);

  static const double dateWidth = 140;
  static const double hourWidth = 90;
  static const double taskWidth = 220;
  static const double messageWidth = 240;
  static const double projectWidth = 160;

  double get tableWidth =>
      dateWidth + hourWidth + taskWidth + messageWidth + projectWidth;

  @override
  void initState() {
    super.initState();

    _entries.addAll(_generateDay(DateTime.now()));
    _verticalController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_verticalController.position.maxScrollExtent == 0) {
        _loadNextDay();
      }
    });
  }

  void _onScroll() {
    if (_verticalController.position.pixels >=
        _verticalController.position.maxScrollExtent &&
        !_loading) {
      _loading = true;
      _loadNextDay();
    }
  }

  List<TimelineEntry> _generateDay(DateTime day) {
    return List.generate(hoursPerDay, (i) {
      return TimelineEntry(
        DateTime(day.year, day.month, day.day, startHour + i),
      );
    });
  }

  void _loadNextDay() {
    final last = _entries.last.dateTime;
    final nextDay = DateTime(last.year, last.month, last.day + 1);

    setState(() {
      _entries.addAll(_generateDay(nextDay));
      _loading = false;
    });
  }

  Widget _cell({
    required double width,
    required Widget child,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: borderColor),
          bottom: BorderSide(color: borderColor),
        ),
      ),
      child: child,
    );
  }

  Widget _row(TimelineEntry e, int index) {
    return Container(
      color: index.isEven ? rowLight : rowDark,
      child: Row(
        children: [
          _cell(
            width: dateWidth,
            child: Text(
              DateFormat('EEEE, dd MMM yyyy').format(e.dateTime),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          _cell(
            width: hourWidth,
            child: Text(
              DateFormat('HH:mm').format(e.dateTime),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          _cell(
            width: taskWidth,
            child: TextField(
              controller: e.task,
              readOnly: true,
              decoration: const InputDecoration(
                hintText: 'Task',
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          _cell(
            width: messageWidth,
            child: TextField(
              controller: e.message,
              readOnly: true,
              decoration: const InputDecoration(
                hintText: 'Message',
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          _cell(
            width: projectWidth,
            child: TextField(
              controller: e.project,
              readOnly: true,
              decoration: const InputDecoration(
                hintText: 'Project',
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerCell(String title, double width) {
    return Container(
      width: width,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF7A5CFF),
        ),
        title:  Text(
          'User Name',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: background,
      body: SingleChildScrollView(
        controller: _horizontalController,
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: tableWidth,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [blue, purple, pink],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(16)),
                ),
                child: Row(
                  children: [
                    _headerCell('Date', dateWidth),
                    _headerCell('Hour', hourWidth),
                    _headerCell('Task', taskWidth),
                    _headerCell('Message', messageWidth),
                    _headerCell('Project', projectWidth),
                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                  controller: _verticalController,
                  itemCount: _entries.length,
                  itemBuilder: (_, i) => _row(_entries[i], i),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
