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
          : Colors.white,
      body: child,
    );
  }
}
