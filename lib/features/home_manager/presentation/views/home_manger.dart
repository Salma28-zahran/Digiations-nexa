import 'package:flutter/material.dart';
import 'package:digiations_nexa/features/home_manager/presentation/views/tabs/web_body.dart';
import 'package:digiations_nexa/features/home_manager/presentation/views/tabs/mobile_body.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_tabs.dart';

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
      appBar: const CustomAppBarManager(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// Tabs
              CustomTabs(
                selectedIndex: selectedIndex,
                onTabChanged: (index) {
                  if (index == selectedIndex) return;
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),

              const SizedBox(height: 16),

              /// Content
              Expanded(
                child: IndexedStack(
                  index: selectedIndex,
                  children: const [
                    WebBody(),
                    MobileBody(),
                    // SummaryBody(), // لو حابة ترجعيه
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
