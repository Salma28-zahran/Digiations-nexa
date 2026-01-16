import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget child;
  const BackgroundScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? Colors.black
          : const Color(0xFFF5F5F5),
      body: child,
    );
  }
}
