import 'package:digiations_nexa/features/home_employee/presentation/views/tabs/state_screen.dart';
import 'package:digiations_nexa/features/home_employee/presentation/views/tabs/timeline_screen.dart';
import 'package:digiations_nexa/features/home_employee/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeEmployee extends StatefulWidget {
  const HomeEmployee({super.key});

  @override
  State<HomeEmployee> createState() => _HomeEmployeeState();
}

class _HomeEmployeeState extends State<HomeEmployee> {
  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    /// 🎨 ألوان حسب الثيم
    final Color tabBg =
    isDark ? const Color(0xFF1F1F1F) : Colors.grey.shade200;

    final Color unselectedText =
    isDark ? Colors.white70 : Colors.black54;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            const SizedBox(height: 16),

            /// 🟣 TabBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: tabBg,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF2FA4FF),
                        Color(0xFF7A5CFF),
                        Color(0xFFFF4FD8),
                      ],
                    ),
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

            /// 📄 محتوى التابات
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
