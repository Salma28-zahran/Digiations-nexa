import 'package:flutter/material.dart';
import 'package:digiations_nexa/main.dart';
import '../../../manager_add_tasks/presentation/views/add_tasks.dart';

class CustomAppBarManager extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarManager({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,

      /// 🌙 Theme Toggle (Left)
      leading: IconButton(
        icon: Icon(
          isDark ? Icons.dark_mode : Icons.light_mode,
          color: const Color(0xFF7A5CFF),
        ),
        onPressed: () {
          themeNotifier.value =
          isDark ? ThemeMode.light : ThemeMode.dark;
        },
      ),

      /// 🟣 Logo (Center)
      centerTitle: true,
      title: Image.asset(
        "assets/images/logo.png",
        height: 60,
        fit: BoxFit.contain,
      ),

      /// ➕ Add Task (Right)
      actions: [
        IconButton(
          icon: const Icon(
            Icons.add,
            color: Color(0xFF7A5CFF),
          ),
          onPressed: () {
            _showAddTaskBottomSheet(context, isDark);
          },
        ),
      ],
    );
  }

  void _showAddTaskBottomSheet(BuildContext context, bool isDark) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor:
      isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF4F6FF),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return const AddTaskBottomSheet();
      },
    );
  }
}
