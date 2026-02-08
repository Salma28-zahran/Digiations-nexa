import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/route/routes.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  OutlineInputBorder _border(double radius, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color),
    );
  }

  final int codeLength = 6;
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(codeLength, (_) => TextEditingController());
    _focusNodes = List.generate(codeLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String get _otpCode =>
      _controllers.map((c) => c.text).join();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final Color fieldBorder =
    isDark ?  Color(0xFF3A3A3A) :  Color(0xFFB9C0FF);
    final Color textColor = isDark ? Colors.white : Colors.black87;
    final Color fieldBg = isDark ?  Color(0xFF1E1E1E) : Colors.transparent;

    return  Center(
      child: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              width: screenWidth * 0.75,
              child: Image.asset(
                "assets/images/auth_logo.png",
                fit: BoxFit.contain,
              ),
            ),

            Text(
              'Enter The Confirmation Code We Sent to\nb***32@gmail.com',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 8),

            GestureDetector(
              onTap: () {
              },
              child: Text(
                "Resent Code",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color:  Color(0xFF0080FF),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(codeLength, (index) {
                return SizedBox(
                  width: screenWidth * 0.11,
                  height: 52,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                    decoration: InputDecoration(
                      counterText: "",
                      filled: isDark,
                      fillColor: fieldBg,
                      enabledBorder: _border(10, fieldBorder),
                      focusedBorder:
                      _border(10,  Color(0xFF0080FF)),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index < codeLength - 1) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index + 1]);
                        } else {
                          FocusScope.of(context).unfocus();
                        }
                      } else {
                        if (index > 0) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index - 1]);
                        }
                      }
                    },
                  ),
                );
              }),
            ),

            SizedBox(height: 32),

            Container(
              height: screenHeight * 0.06,
              width: screenWidth * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight * 0.018),
                color:  Color(0xFF0080FF),
              ),
              padding:  EdgeInsets.symmetric(horizontal: 24), // العرض حسب الكلام
              child: InkWell(
                borderRadius: BorderRadius.circular(screenHeight * 0.018),
                onTap: () {
                  Navigator.pushNamed(
                      context, PageRouteName.resetPassword);
                },
                child: Center(
                  child: Text(
                    "Next",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: screenHeight * 0.02,
                      fontWeight: FontWeight.w600,
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
