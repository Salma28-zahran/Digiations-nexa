import 'package:flutter/material.dart';
import '../../../../core/route/routes.dart';
import '../../../../main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,

      leading: IconButton(
        icon: Icon(
          isDark ? Icons.dark_mode : Icons.light_mode,
          color: Colors.deepPurple,
        ),
        onPressed: () {
          themeNotifier.value =
          isDark ? ThemeMode.light : ThemeMode.dark;
        },
      ),

      title: Image.asset(
        isDark
            ? 'assets/images/logo3.png'
            : 'assets/images/logo2.png',
        height: 140,
        fit: BoxFit.contain,
      ),

      actions: [
        PopupMenuButton<int>(
          offset: const Offset(0, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          icon: const Icon(
            Icons.mail,
            color: Color(0xFF7A5CFF),
          ),
          onSelected: (value) {
            if (value == 0) {
              Navigator.pushNamed(
                context,
                PageRouteName.EmployeeTasks,
              );
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem<int>(
              value: 0,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            PopupMenuDivider(),
            PopupMenuItem<int>(
              enabled: false,
              child: Row(
                children: [
                  _NewBadge(),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'New task assigned to you',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _NewBadge extends StatelessWidget {
  const _NewBadge();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF7A5CFF),
            Color(0xFFB388FF),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.4)
                : Colors.deepPurple.withOpacity(0.25),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Text(
        'NEW',
        style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}


