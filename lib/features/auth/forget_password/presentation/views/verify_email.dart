import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/route/routes.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  OutlineInputBorder _border(double radius, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final Color fieldBorder = isDark
        ?  Color(0xFF3A3A3A)
        :  Color(0xFFB9C0FF);
    final Color hintColor = isDark ? Colors.white60 : Colors.grey;
    final Color textColor = isDark ? Colors.white : Colors.black87;
    final Color fieldBg = isDark ? const Color(0xFF1E1E1E) : Colors.transparent;
    return Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              SizedBox(
                width: screenWidth * 0.75,
                child: Image.asset(
                  "assets/images/auth_logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                "Please verify your email!",
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 8),

              // Subtitle
              Text(
                "Enter Your Email Address to Receive a verification code",
                textAlign: TextAlign.center,
                style:  GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
              ),

              SizedBox(height: 32),

              TextField(
                style: GoogleFonts.poppins(
                  fontSize: screenHeight * 0.02,
                  color: textColor,
                ),
                decoration: InputDecoration(
                  filled: isDark,
                  fillColor: fieldBg,
                  hintText: "Email",
                  hintStyle:  GoogleFonts.poppins(
                    color: hintColor,
                    fontSize: screenHeight * 0.02,
                  ),
                  prefixIcon:  Icon(
                    Icons.email_outlined,
                    color: Color(0xFF0080FF),
                  ),
                  enabledBorder: _border(screenHeight * 0.04, fieldBorder),
                  focusedBorder: _border(screenHeight * 0.04, fieldBorder),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.022,
                    horizontal: screenWidth * 0.05,
                  ),
                ),
              ),

               SizedBox(height: 24),

              Container(
                height: screenHeight * 0.06,
                width: screenWidth * 0.38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenHeight * 0.018),
                  color:  Color(0xFF0080FF),
                ),
                padding:  EdgeInsets.symmetric(horizontal: 24), // العرض حسب الكلام
                child: InkWell(
                  borderRadius: BorderRadius.circular(screenHeight * 0.018),
                  onTap: () {
                    Navigator.pushNamed(context, PageRouteName.verifyCode);
                  },
                  child: Center(
                    child: Text(
                      "Send Code",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),


              SizedBox(height: 40),

               Text(
                "Question? Email us!\n support@streamore.io",
                textAlign: TextAlign.center,
                style:  GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ),
      );

  }
}
