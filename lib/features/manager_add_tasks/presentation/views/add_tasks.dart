import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          // ================= Header =================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Task name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ================= Task name =================
          TextField(
            decoration: InputDecoration(
              hintText: 'Task name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ================= Description =================
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ================= Assignee & Deadline =================
          Column(
            children: [
              // -------- Assignee Dropdown --------
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedAssignee,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: assignees.map((name) {
                    return DropdownMenuItem<String>(
                      value: name,
                      child: Row(
                        children: [
                          const Icon(Icons.person, size: 20),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Assignee',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedAssignee = value!;
                    });
                  },
                ),
              ),

              const SizedBox(height: 12),

              // -------- Deadline --------
              GestureDetector(
                onTap: () => _pickDateTime(),
                child: Row(
                  children: [
                    const Icon(Icons.date_range, size: 20),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Deadline',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          selectedDate == null
                              ? 'Pick date'
                              : _formatDate(selectedDate!),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.calendar_today, size: 20),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ================= Actions =================
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                    onTap: () {
                    },
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

  /* ================= Date & Time Picker ================= */

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

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month} · ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}
