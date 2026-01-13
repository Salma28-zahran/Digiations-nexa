import 'package:digiations_nexa/core/route/routes.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,

      title: Image.asset(
        'assets/images/logo2.png',
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
              Navigator.pushNamed(context, PageRouteName.EmployeeTasks);
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem<int>(
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

            const PopupMenuDivider(),

            const PopupMenuItem<int>(
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text(
        'NEW',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
