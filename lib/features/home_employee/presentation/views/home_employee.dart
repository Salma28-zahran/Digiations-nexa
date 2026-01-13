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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            const SizedBox(height: 16),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
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
                  unselectedLabelColor: Colors.black54,
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
                  TimelineScreen()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
