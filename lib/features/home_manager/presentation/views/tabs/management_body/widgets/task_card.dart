import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatelessWidget {
  final String taskTitle;
  final String deadline;
  final String projectName;
  final Function(String, String) onSave;

  const TaskCard({
    super.key,
    required this.taskTitle,
    required this.deadline,
    required this.projectName,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding:  EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? Colors.transparent : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskTitle,
                    style:  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                   SizedBox(height: 8),

                  Row(
                    children: [
                       Icon(
                        Icons.calendar_month,
                        size: 18,
                        color: Color(0xFF4A90E2),
                      ),
                       SizedBox(width: 6),
                      Text(
                        deadline,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),

                   SizedBox(height: 6),

                  Row(
                    children: [
                       Text(
                        "Project: ",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        projectName,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () => _showEditBottomSheet(context),
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color:  Color(0xFF4A90E2).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:  Icon(
                  Icons.edit,
                  color: Color(0xFF4A90E2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditBottomSheet(BuildContext context) {
    final titleController = TextEditingController(text: taskTitle);
    final deadlineController = TextEditingController(text: deadline);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Text(
                'Edit Task',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
               SizedBox(height: 16),

              TextField(
                controller: titleController,
                decoration:  InputDecoration(labelText: 'Task Title'),
              ),

               SizedBox(height: 12),

              TextField(
                controller: deadlineController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Deadline',
                  suffixIcon: IconButton(
                    icon:  Icon(Icons.calendar_month, color: Color(0xFF4A90E2)),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        final formattedDate =
                        DateFormat('MMM dd, yyyy').format(pickedDate);
                        deadlineController.text = formattedDate;
                      }
                    },
                  ),
                ),
              ),

               SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  onSave(
                    titleController.text,
                    deadlineController.text,
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color(0xFF4A90E2),
                  minimumSize:  Size(double.infinity, 48),
                ),
                child:  Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
