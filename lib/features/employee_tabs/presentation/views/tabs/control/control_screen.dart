import 'package:digiations_nexa/features/employee_tabs/presentation/views/tabs/control/tabs/state_screen.dart';
import 'package:digiations_nexa/features/employee_tabs/presentation/views/tabs/control/tabs/timeline_screen.dart';
import 'package:digiations_nexa/features/main_employee/presentation/widgets/custom_appbar.dart';
import 'package:digiations_nexa/features/main_employee/presentation/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _HomeEmployeeState();
}

class _HomeEmployeeState extends State<ControlScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color tabBg =
    isDark ? const Color(0xFF1F1F1F) : Colors.white;

    final Color unselectedText =
    isDark ? Colors.white : Colors.black54;


    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Column(
          children: [
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 50,
               // padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: tabBg,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),

                child: TabBar(
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF4A90E2)
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: unselectedText,
                  labelPadding: EdgeInsets.zero,
                  tabs: const [
                    Tab(text: "State"),
                    Tab(text: "Timeline"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Expanded(
              child: TabBarView(
                children: [
                  StateScreen(),
                  TimelineScreen(),
                ],
              ),
            ),
          ],

        ),

      ),
    );
  }
}
