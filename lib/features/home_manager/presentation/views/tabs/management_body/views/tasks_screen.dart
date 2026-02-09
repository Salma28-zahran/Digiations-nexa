import 'package:digiations_nexa/features/manager_add_tasks_projects/presentation/views/add_tasks.dart';
import 'package:flutter/material.dart';
import '../widgets/task_card.dart';

class TasksScreenManagement extends StatefulWidget {
  const TasksScreenManagement({super.key});

  @override
  State<TasksScreenManagement> createState() => _TasksScreenManagementState();
}

class _TasksScreenManagementState extends State<TasksScreenManagement> {
  final tasks = [
    {
      "title": "Prepare presentation slides",
      "due": "Apr 18, 2024",
      "project": "Digiation-Nexa",
    },
    {
      "title": "Send weekly report to manager",
      "due": "Today",
      "project": "Hammam",
    },
    {
      "title": "Test new app features",
      "due": "Tomorrow",
      "project": "Asaaned",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;



    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Color(0xFF4A90E2), // لون السهم فقط
        ),
        title: Text('Tasks' ,style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
        ),),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon:  Icon(
                Icons.add,
                color: Color(0xFF4A90E2)
            ),
            onPressed: () {
              _showAddTaskBottomSheet(context, isDark);
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: tasks.length,
        separatorBuilder: (_, __) =>  SizedBox(height: 12),
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskCard(
            taskTitle: task["title"]!,
            deadline: task["due"]!,
            projectName: task["project"]!,
            onSave:(newTitle, newDeadline) {
              setState(() {
                tasks[index]["title"] = newTitle;
                tasks[index]["due"] = newDeadline;
              });
            },
          );
        },
      ),
    );
  }
}
void _showAddTaskBottomSheet(BuildContext context, bool isDark) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor:
    isDark ?  Color(0xFF1E1E1E) :  Color(0xFFF4F6FF),
    shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return  AddTaskBottomSheet();
    },
  );
}

