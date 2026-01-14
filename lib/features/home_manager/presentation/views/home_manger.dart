import 'package:digiations_nexa/features/home_manager/presentation/views/tabs/summary_body.dart';
import 'package:digiations_nexa/features/home_manager/presentation/views/tabs/web_body.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_tabs.dart';
import 'tabs/mobile_body.dart';
class HomeManger extends StatefulWidget {
  const HomeManger({super.key});

  @override
  State<HomeManger> createState() => _HomeMangerState();
}
class _HomeMangerState extends State<HomeManger> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBarManager(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTabs(
              selectedIndex: selectedIndex,
              onTabChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),

            const SizedBox(height: 16),

            Expanded(
              child: IndexedStack(
                index: selectedIndex,
                children: const [
                  WebBody(),
                  MobileBody(),
                  /*SummaryBody(),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





