import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget child;
  const BackgroundScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [
            const Color(0xFF0F2027),
            const Color(0xFF203A43),
            const Color(0xFF2C5364),
          ]
              : [
            const Color(0xFFBFDFFF),
            const Color(0xFFEAF3FF),
            const Color(0xFFF7FAFF),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: child,
      ),
    );
  }
}
