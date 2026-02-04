import 'package:digiations_nexa/features/employee_tabs/presentation/views/tabs/control/control_screen.dart';
import 'package:digiations_nexa/features/employee_tabs/presentation/views/tabs/profile_screen.dart';
import 'package:digiations_nexa/features/employee_tabs/presentation/views/tabs/tasks_screen.dart';
import 'package:digiations_nexa/features/main_employee/presentation/widgets/custom_appbar.dart' show CustomAppBar;
import 'package:digiations_nexa/features/main_employee/presentation/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

class MainEmployee extends StatefulWidget {
  const MainEmployee({super.key});

  @override
  State<MainEmployee> createState() => _MainEmployeeState();
}

class _MainEmployeeState extends State<MainEmployee> {

  int currentIndex = 0;

  final List<Widget> screens = const [
    ControlScreen(),
    TasksScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const CustomAppBar(),

      body: screens[currentIndex],

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
