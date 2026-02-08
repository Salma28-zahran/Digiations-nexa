import 'package:digiations_nexa/features/home_manager/presentation/widgets/custom_buttom_nav_manager.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import 'home_tabs/control_tab.dart';
import 'home_tabs/employee_tab.dart';
import 'home_tabs/profile_tab.dart';

class HomeManger extends StatefulWidget {
  const HomeManger({super.key});

  @override
  State<HomeManger> createState() => _HomeMangerState();
}

class _HomeMangerState extends State<HomeManger> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    ControlTab(),
    EmployeeTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(

      appBar:  CustomAppBarManager(),

      body: pages[selectedIndex],
      bottomNavigationBar: CustomBottomNavBarManager(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}