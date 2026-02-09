import 'package:digiations_nexa/features/manager_add_tasks_projects/presentation/views/add_projects.dart';
import 'package:flutter/material.dart';

import '../../../../../../manager_add_tasks_projects/presentation/views/add_tasks.dart';
import '../widgets/project_card.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  List<Map<String, String>> projects = [
    {
      'name': 'Hammam',
      'deadline': 'May 30, 2026',
    },
    {
      'name': 'Asaaned',
      'deadline': 'May 12, 2026',
    },
    {
      'name': 'Digiation-Nexa',
      'deadline': 'March 5, 2026',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Projects' ,style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
        ),),
        centerTitle: true,
        backgroundColor: isDark ? Colors.black : Colors.white,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Color(0xFF4A90E2), // لون السهم فقط
        ),
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
        padding:  EdgeInsets.symmetric(vertical: 16),
        itemCount: projects.length,
        separatorBuilder: (_, __) =>  SizedBox(height: 12),
        itemBuilder: (context, index) {
          return ProjectCard(
            projectName: projects[index]['name']!,
            deadline: projects[index]['deadline']!,
            onSave: (newName, newDeadline) {
              setState(() {
                projects[index]['name'] = newName;
                projects[index]['deadline'] = newDeadline;
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
    isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF4F6FF),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return const AddProjectBottomSheet();
    },
  );
}
