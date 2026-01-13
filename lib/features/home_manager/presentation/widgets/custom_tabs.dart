import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  const CustomTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  final List<String> tabs = const ['Web', 'Mobile', 'Summary'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF3EFEA),
        borderRadius: BorderRadius.circular(24),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final tabWidth = constraints.maxWidth / tabs.length;

          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                left: selectedIndex * tabWidth,
                child: Container(
                  width: tabWidth,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF4FACFE),
                        Color(0xFFB721FF),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              Row(
                children: List.generate(
                  tabs.length,
                      (index) => Expanded(
                    child: GestureDetector(
                      onTap: () => onTabChanged(index),
                      child: Center(
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: selectedIndex == index
                                ? Colors.white
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
