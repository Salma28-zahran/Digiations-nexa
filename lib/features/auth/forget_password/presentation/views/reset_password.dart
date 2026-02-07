import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/route/routes.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  OutlineInputBorder _border(double radius, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color),
    );
  }

  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final Color fieldBorder =
    isDark ?  Color(0xFF3A3A3A) :  Color(0xFFB9C0FF);
    final Color hintColor = isDark ? Colors.white60 : Colors.grey;
    final Color textColor = isDark ? Colors.white : Colors.black87;
    final Color fieldBg = isDark ?  Color(0xFF1E1E1E) : Colors.transparent;

    return Center(
      child: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),

            Text(
              "Reset\nPassword",
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),

            SizedBox(height: 32),

            // New Password
            TextField(
              obscureText: _obscureNew,
              style: GoogleFonts.poppins(
                fontSize: screenHeight * 0.02,
                color: textColor,
              ),
              decoration: InputDecoration(
                filled: isDark,
                fillColor: fieldBg,
                hintText: "New Password",
                hintStyle: GoogleFonts.poppins(
                  color: hintColor,
                  fontSize: screenHeight * 0.02,
                ),
                prefixIcon:  Icon(
                  Icons.lock_outline,
                  color: Color(0xFF0080FF),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureNew
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Color(0xFF0080FF),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureNew = !_obscureNew;
                    });
                  },
                ),
                enabledBorder: _border(screenHeight * 0.04, fieldBorder),
                focusedBorder: _border(screenHeight * 0.04, fieldBorder),
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.022,
                  horizontal: screenWidth * 0.05,
                ),
              ),
            ),

            SizedBox(height: 16),

            TextField(
              obscureText: _obscureConfirm,
              style: GoogleFonts.poppins(
                fontSize: screenHeight * 0.02,
                color: textColor,
              ),
              decoration: InputDecoration(
                filled: isDark,
                fillColor: fieldBg,
                hintText: "Confirm Password",
                hintStyle: GoogleFonts.poppins(
                  color: hintColor,
                  fontSize: screenHeight * 0.02,
                ),
                prefixIcon:  Icon(
                  Icons.lock_outline,
                  color: Color(0xFF0080FF),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirm
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Color(0xFF0080FF),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirm = !_obscureConfirm;
                    });
                  },
                ),
                enabledBorder: _border(screenHeight * 0.04, fieldBorder),
                focusedBorder: _border(screenHeight * 0.04, fieldBorder),
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.022,
                  horizontal: screenWidth * 0.05,
                ),
              ),
            ),

            SizedBox(height: 32),

            // Reset Button
            Center(
              child: Container(
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFF0080FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                    EdgeInsets.symmetric(horizontal: 48),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, PageRouteName.login);
                  },
                  child: Text(
                    "Reset",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
