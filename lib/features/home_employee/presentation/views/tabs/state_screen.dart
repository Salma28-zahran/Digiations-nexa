import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({super.key});

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen>
    with SingleTickerProviderStateMixin {
  String currentState = "Absent";

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  static const Color primaryBlue = Color(0xFF4A90E2);

  static const Color inactiveGrayLight = Color(0xFFE5E5E5);
  static const Color inactiveTextLight = Color(0xFF9E9E9E);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
      lowerBound: 0.85,
      upperBound: 1.0,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateState(String value) {
    setState(() {
      currentState = value;
    });
    _controller.forward(from: 0.85);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color inactiveBg =
    isDark ? const Color(0xFF2A2A2A) : inactiveGrayLight;

    final Color inactiveText =
    isDark ? Colors.white70 : inactiveTextLight;

    final Color shadowColor =
    isDark ? Colors.black.withOpacity(.6) : Colors.black.withOpacity(.15);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            ScaleTransition(
              scale: _scaleAnimation,
              child: _currentStateCard(shadowColor),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _button("Check In", isDark, inactiveBg, inactiveText),
                _button("Break", isDark, inactiveBg, inactiveText),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _button("Check Out", isDark, inactiveBg, inactiveText),
                _button("Absent", isDark, inactiveBg, inactiveText),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _currentStateCard(Color shadowColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Current State",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white.withOpacity(.75),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            currentState,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _button(
      String label,
      bool isDark,
      Color inactiveBg,
      Color inactiveText,
      ) {
    final bool isSelected = currentState == label;

    return GestureDetector(
      onTap: () => _updateState(label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        width: 140,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? primaryBlue : inactiveBg,
          borderRadius: BorderRadius.circular(22),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? .6 : .25),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : inactiveText,
          ),
        ),
      ),
    );
  }
}
