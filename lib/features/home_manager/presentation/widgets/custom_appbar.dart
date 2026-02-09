import 'package:flutter/material.dart';
import 'package:digiations_nexa/main.dart';

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

      centerTitle: true,
      title: Image.asset(
        "assets/images/logo.png",
        height: 60,
        fit: BoxFit.contain,
      ),


    );
  }

}
