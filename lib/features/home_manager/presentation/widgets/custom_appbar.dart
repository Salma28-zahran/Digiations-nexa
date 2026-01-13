import 'package:digiations_nexa/core/route/routes.dart';
import 'package:flutter/material.dart';

import '../../../manager_add_tasks/presentation/views/add_tasks.dart';

class CustomAppBarManager extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarManager({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Image.asset(
        'assets/images/logo2.png',
        height: 140,
        fit: BoxFit.contain,
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.add,
            color: Color(0xFF7A5CFF),
          ),
          onPressed: () {
            _showAddTaskBottomSheet(context);
          },
        ),
      ],
    );
  }
  void _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
        backgroundColor: Color(0xFFF4F6FF),
    isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return const AddTaskBottomSheet();
      },
    );
  }

}
