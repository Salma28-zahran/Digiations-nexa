import 'package:flutter/material.dart';

import '../../widgets/custom_tabs.dart';
import '../tabs/mobile_body.dart';
import '../tabs/web_body.dart';

class EmployeeTab extends StatefulWidget {
  const EmployeeTab({super.key});

  @override
  State<EmployeeTab> createState() => _EmployeeTabState();
}

class _EmployeeTabState extends State<EmployeeTab> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTabs(
              selectedIndex: selectedTabIndex,
              onTabChanged: (index) {
                if (index == selectedTabIndex) return;
                setState(() {
                  selectedTabIndex = index;
                });
              },
            ),

            const SizedBox(height: 16),

            Expanded(
              child: SingleChildScrollView(
                child: IndexedStack(
                  index: selectedTabIndex,
                  children:  [
                    WebBody(),
                    MobileBody(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
