import 'package:flutter/material.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({super.key});

  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen>
    with SingleTickerProviderStateMixin {
  String currentState = "Absent";

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  static const LinearGradient appGradient = LinearGradient(
    colors: [
      Color(0xFF2FA4FF),
      Color(0xFF7A5CFF),
      Color(0xFFFF4FD8),
    ],
  );

  static const Color inactiveGray = Color(0xFFE5E5E5);
  static const Color inactiveText = Color(0xFF9E9E9E);

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            ScaleTransition(
              scale: _scaleAnimation,
              child: _currentStateCard(),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _gradientButton("Check In"),
                _gradientButton("Break"),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _gradientButton("Check Out"),
                _gradientButton("Absent"),
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
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        gradient: appGradient,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Current State",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            currentState,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }


  Widget _gradientButton(String label) {
    final bool isSelected = currentState == label;

    return GestureDetector(
      onTap: () => _updateState(label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        width: 140,
        height: 48,
        decoration: BoxDecoration(
          gradient: isSelected ? appGradient : null,
          color: isSelected ? null : inactiveGray,
          borderRadius: BorderRadius.circular(22),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : inactiveText,
          ),
        ),
      ),
    );
  }
}