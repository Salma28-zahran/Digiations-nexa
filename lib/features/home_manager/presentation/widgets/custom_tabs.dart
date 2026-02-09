import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget {
  final List<String> tabs;
  final TabController controller;

  const CustomTabs({
    super.key,
    required this.tabs,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color tabBg =
    isDark ? const Color(0xFF1F1F1F) : Colors.white;

    final Color unselectedText =
    isDark ? Colors.white : Colors.black54;

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: tabBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: TabBar(
        controller: controller,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: unselectedText,
        labelPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
          color: const Color(0xFF4A90E2),
          borderRadius: BorderRadius.circular(20),
        ),
        tabs: tabs.map((e) => Tab(text: e)).toList(),
      ),
    );
  }
}
