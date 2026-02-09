import 'package:digiations_nexa/features/home_manager/presentation/widgets/custom_tabs.dart';
import 'package:flutter/material.dart';

import '../tabs/mobile_body.dart';
import '../tabs/web_body.dart';

class EmployeeTab extends StatefulWidget {
  const EmployeeTab({super.key});

  @override
  State<EmployeeTab> createState() => _EmployeeTabState();
}

class _EmployeeTabState extends State<EmployeeTab>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
        
            CustomTabs(
              controller: _tabController,
              tabs: const ['Web', 'Mobile'],
            ),
        
            const SizedBox(height: 24),
        
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  WebBody(),
                  MobileBody(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
