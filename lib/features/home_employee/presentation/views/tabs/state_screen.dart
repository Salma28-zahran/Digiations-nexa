import 'package:flutter/material.dart';

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

  /// 🎨 الألوان الأساسية (ثابتة)
  static const LinearGradient appGradient = LinearGradient(
    colors: [
      Color(0xFF2FA4FF),
      Color(0xFF7A5CFF),
      Color(0xFFFF4FD8),
    ],
  );

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

    /// 🎯 ألوان متغيرة حسب الثيم
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

            /// 🟣 كارت الحالة الحالية
            ScaleTransition(
              scale: _scaleAnimation,
              child: _currentStateCard(shadowColor),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _gradientButton(
                  "Check In",
                  isDark,
                  inactiveBg,
                  inactiveText,
                ),
                _gradientButton(
                  "Break",
                  isDark,
                  inactiveBg,
                  inactiveText,
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _gradientButton(
                  "Check Out",
                  isDark,
                  inactiveBg,
                  inactiveText,
                ),
                _gradientButton(
                  "Absent",
                  isDark,
                  inactiveBg,
                  inactiveText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 🟪 كارت الحالة الحالية
  Widget _currentStateCard(Color shadowColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        gradient: appGradient,
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
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(.75),
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

  /// 🔘 زر متدرج
  Widget _gradientButton(
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
          gradient: isSelected ? appGradient : null,
          color: isSelected ? null : inactiveBg,
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
