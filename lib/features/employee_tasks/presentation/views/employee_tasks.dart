import 'package:digiations_nexa/features/home_employee/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeTasks extends StatefulWidget {
  const EmployeeTasks({super.key});

  @override
  State<EmployeeTasks> createState() => _EmployeeTasksState();
}

class _EmployeeTasksState extends State<EmployeeTasks>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isDark ? const Color(0xFF121212) : const Color(0xFFF4F6FF);
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,

      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
            color: Color(0xFF4A90E2)
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      title: Image.asset(
        "assets/images/logo.png",
        height: 60,
        fit: BoxFit.contain,
      ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 44,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1C1C1C) : const Color(0xFFE9ECF5),
                borderRadius: BorderRadius.circular(18),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorAnimation: TabIndicatorAnimation.linear,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                splashBorderRadius: BorderRadius.circular(14),
                indicator: BoxDecoration(
                  color: const Color(0xFF4A90E2),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.18),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                labelColor: Colors.white,
                labelStyle: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelColor:
                isDark ? Colors.white70 : Colors.black54,
                tabs: const [
                  Tab(text: 'New'),
                  Tab(text: 'In Progress'),
                  Tab(text: 'Done'),
                ],
              ),
            ),
          ),


          const SizedBox(height: 16),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _tasksList(cardColor, textColor),
                _tasksList(cardColor, textColor),
                _tasksList(cardColor, textColor),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tasksList(Color cardColor, Color textColor) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Task Title ${index + 1}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Task description goes here and explains what the employee should do.',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: textColor.withOpacity(.7),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
