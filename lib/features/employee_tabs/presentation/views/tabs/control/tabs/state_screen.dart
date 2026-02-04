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
  static const Color purple = Color(0xFF8E44AD);
  static const Color red = Color(0xFFE74C3C);
  static const Color darkGray = Color(0xFF4A4A4A);
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
    final Color inactiveBg = isDark ? const Color(0xFF2A2A2A) : inactiveGrayLight;
    final Color inactiveText = isDark ? Colors.white : inactiveTextLight;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            ScaleTransition(
              scale: _scaleAnimation,
              child: _currentStateCard(),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _button("Check In", inactiveBg, inactiveText),
                const SizedBox(width: 15),
                _button("Break", inactiveBg, inactiveText),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _button("Check Out", inactiveBg, inactiveText),
                const SizedBox(width: 15),
                _button("Absent", inactiveBg, inactiveText),
              ],
            ),

          ],
        ),
      ),
    );
  }


  Widget _currentStateCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.circular(20),
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


  Widget _button(String label, Color inactiveBg, Color inactiveText) {
    final bool isSelected = currentState == label;

    Color mainColor;
    switch (label) {
      case "Check In":
        mainColor = primaryBlue;
        break;
      case "Break":
        mainColor = purple;
        break;
      case "Check Out":
        mainColor = darkGray;
        break;
      case "Absent":
        mainColor = red;
        break;
      default:
        mainColor = primaryBlue;
    }

    return GestureDetector(
      onTap: () => _updateState(label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 140,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? mainColor.withOpacity(0.15) : inactiveBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? mainColor : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? mainColor : inactiveText,
          ),
        ),
      ),
    );
  }

}
