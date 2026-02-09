import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ProjectCard extends StatelessWidget {
  final String projectName;
  final String deadline;
  final Function(String, String) onSave;

  const ProjectCard({
    super.key,
    required this.projectName,
    required this.deadline,
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
          border: Border.all(color: Colors.grey.shade300,width: 1.5),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    projectName,
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
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _showEditBottomSheet(context),
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFF4A90E2).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
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
    final nameController = TextEditingController(text: projectName);
    final deadlineController = TextEditingController(text: deadline);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
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
              const Text(
                'Edit Project',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Project Name'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: deadlineController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Deadline',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_month, color: Color(0xFF4A90E2)),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  onSave(
                    nameController.text,
                    deadlineController.text,
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text(
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
