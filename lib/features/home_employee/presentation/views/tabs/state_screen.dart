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

  static const Color primaryBlue = Color(0xFF0080FF);

  static const Color inactiveGrayLight = Colors.white;
  static const Color inactiveTextLight = Color(0xFF9E9E9E);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
      lowerBound: 0.9,
      upperBound: 1.0,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
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
    _controller.forward(from: 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color inactiveBg =
    isDark ? const Color(0xFF2A2A2A) : inactiveGrayLight;

    final Color inactiveText =
    isDark ? Colors.white : inactiveTextLight;

    return Scaffold(
      backgroundColor:
      isDark ? const Color(0xFF121212) : const Color(0xFFF7F7F7),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Current State Card
            ScaleTransition(
              scale: _scaleAnimation,
              child: _currentStateCard(),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _button("Check In", inactiveBg, inactiveText),
                _button("Break", inactiveBg, inactiveText),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _button("Check Out", inactiveBg, inactiveText),
                _button("Absent", inactiveBg, inactiveText),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------
  // Current State Card
  // -------------------------
  Widget _currentStateCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        children: [
          Text(
            "Current State",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white,
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

  // -------------------------
  // Button
  // -------------------------
  Widget _button(
      String label,
      Color inactiveBg,
      Color inactiveText,
      ) {
    final bool isSelected = currentState == label;

    return GestureDetector(
      onTap: () => _updateState(label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 140,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? primaryBlue : inactiveBg,
          borderRadius: BorderRadius.circular(2),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : inactiveText,
          ),
        ),
      ),
    );
  }
}
