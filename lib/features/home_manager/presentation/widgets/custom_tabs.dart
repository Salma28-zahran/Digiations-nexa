import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

   CustomTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  final List<String> tabs = ['Web', 'Mobile'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 50,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.transparent
            : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.grey,
          width: 2
        )
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final tabWidth = constraints.maxWidth / tabs.length;

          return Stack(
            children: [
              /// 🔵 Active Tab
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                left: selectedIndex * tabWidth,
                child: Container(
                  width: tabWidth,
                  height: 40,
                  decoration: BoxDecoration(
                  color: Color(0xFF0080FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              /// 🏷 Tabs Text
              Row(
                children: List.generate(
                  tabs.length,
                      (index) => Expanded(
                    child: GestureDetector(
                      onTap: () => onTabChanged(index),
                      behavior: HitTestBehavior.opaque,
                      child: Center(
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: selectedIndex == index
                                ? Colors.white
                                : isDark
                                ? Colors.white60
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
