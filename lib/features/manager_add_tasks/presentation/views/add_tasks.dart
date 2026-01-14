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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Task name',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: Color(0xFF7A5CFF), size: 20),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          SizedBox(height: 12),

          TextField(
            decoration: InputDecoration(
              hintText: 'Task name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          SizedBox(height: 12),

          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          SizedBox(height: 16),

          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person, color: Color(0xFF7A5CFF), size: 20),
                  SizedBox(width: 8),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Assignee',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        selectedAssignee,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),

                  Spacer(),

                  PopupMenuButton<String>(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(minWidth: 120),
                    color: Color(0xFFE3EEFF),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF7A5CFF),
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
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),

              SizedBox(height: 12),

              GestureDetector(
                onTap: () => _pickDateTime(),
                child: Row(
                  children: [
                    Icon(Icons.date_range, color: Color(0xFF7A5CFF), size: 20),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Deadline',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          selectedDate == null
                              ? 'Pick date'
                              : formatDate(selectedDate!),
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.calendar_today,
                      color: Color(0xFF7A5CFF),
                      size: 20,
                    ),
                    SizedBox(width: 14),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: screenHeight * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenHeight * 0.018),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF2FA4FF),
                          Color(0xFF7A5CFF),
                          Color(0xFFFF4FD8),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Send",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
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
