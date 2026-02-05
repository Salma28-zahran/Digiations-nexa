import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String selectedAssignee = 'Salma Zahran';
  DateTime? selectedDate;

  final List<String> assignees = [
    'Salma Zahran',
    'mohamed mostafa',
    'Mohamed Samy',
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final fieldColor = isDark ? const Color(0xFF2A2A2A) : Colors.white;
    final borderColor = isDark ? Colors.white24 : Colors.grey.shade300;
    final textColor = isDark ? Colors.white : Colors.black;
    final hintColor = isDark ? Colors.white54 : Colors.grey;

    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Task name',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Color(0xFF4A90E2),
                  size: 20,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Task name
          TextField(
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              hintText: 'Task name',
              hintStyle: TextStyle(color: hintColor),
              filled: true,
              fillColor: fieldColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColor),
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// Description
          TextField(
            maxLines: 3,
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              hintText: 'Description',
              hintStyle: TextStyle(color: hintColor),
              filled: true,
              fillColor: fieldColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColor),
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// Assignee
          Row(
            children: [
              const Icon(Icons.person, color: Color(0xFF4A90E2), size: 20),
              const SizedBox(width: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assignee',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: hintColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    selectedAssignee,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              PopupMenuButton<String>(
                color: isDark
                    ? const Color(0xFF2A2A2A)
                    : const Color(0xFFE3EEFF),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFF4A90E2),
                ),
                onSelected: (value) {
                  setState(() {
                    selectedAssignee = value;
                  });
                },
                itemBuilder: (context) {
                  return assignees.map((name) {
                    return PopupMenuItem<String>(
                      value: name,
                      child: Text(
                        name,
                        style: GoogleFonts.poppins(color: textColor),
                      ),
                    );
                  }).toList();
                },
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Deadline
          GestureDetector(
            onTap: _pickDateTime,
            child: Row(
              children: [
                const Icon(
                  Icons.date_range,
                  color: Color(0xFF4A90E2),
                  size: 20,
                ),
                const SizedBox(width: 8),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deadline',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: hintColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      selectedDate == null
                          ? 'Pick date'
                          : formatDate(selectedDate!),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                const Icon(
                  Icons.calendar_today,
                  color: Color(0xFF4A90E2),
                  size: 20,
                ),
                SizedBox(width: 14,)
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// Buttons
          Row(
            children: [
              Expanded(
                child: Container(
                  height: screenHeight * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenHeight * 0.018),
                    color: Color(0xFF4A90E2),
                  ),
                  child: Center(
                    child: Text(
                      "Send",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(color: hintColor),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Future<void> _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null) return;

    setState(() {
      selectedDate = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  String formatDate(DateTime date) {
    return DateFormat('MMMM d h:mm a').format(date).toLowerCase();
  }
}
