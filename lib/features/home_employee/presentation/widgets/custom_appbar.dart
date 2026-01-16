import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            color: Color(0xFF4A90E2)
        ),
        onPressed: () {
          themeNotifier.value =
          isDark ? ThemeMode.light : ThemeMode.dark;
        },
      ),

      title: Image.asset(
        "assets/images/logo.png",
        height: 60,
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
              color: Color(0xFF4A90E2)
          ),
          onSelected: (value) {
            if (value == 0) {
              Navigator.pushNamed(
                context,
                PageRouteName.EmployeeTasks,
              );
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'See all',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF4A90E2),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const PopupMenuDivider(),
            PopupMenuItem<int>(
              enabled: false,
              child: Row(
                children: [
                  const _NewBadge(),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'New task assigned to you',
                      style:GoogleFonts.poppins(
                          fontSize: 14),
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
          color: Color(0xFF4A90E2),
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
      child:  Text(
        'NEW',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}


