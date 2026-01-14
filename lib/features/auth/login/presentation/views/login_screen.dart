import 'package:digiations_nexa/core/route/routes.dart';
import 'package:digiations_nexa/core/widgets/constants/user_role.dart';
import 'package:digiations_nexa/core/widgets/storage/UserRoleStorage.dart';
import 'package:digiations_nexa/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

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

    final Color fieldBorder =
    isDark ? const Color(0xFF3A3A3A) : const Color(0xFFB9C0FF);
    final Color hintColor =
    isDark ? Colors.white60 : Colors.grey;
    final Color textColor =
    isDark ? Colors.white : Colors.black87;
    final Color fieldBg =
    isDark ? const Color(0xFF1E1E1E) : Colors.transparent;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          /// 🌙 Theme Toggle (Top Left)
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                color: Colors.deepPurple,
              ),
              onPressed: () {
                themeNotifier.value =
                isDark ? ThemeMode.light : ThemeMode.dark;
              },
            ),
          ),

          /// 🔐 Login Content
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 🟣 Logo
                  SizedBox(
                    width: screenWidth * 0.75,
                    child: Image.asset(
                      isDark
                          ? "assets/images/logo3.png"
                          : "assets/images/logo2.png",
                      fit: BoxFit.contain,
                    ),
                  ),

                  /// 📧 Email
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: TextField(
                      style: GoogleFonts.inter(
                        fontSize: screenHeight * 0.02,
                        color: textColor,
                      ),
                      decoration: InputDecoration(
                        filled: isDark,
                        fillColor: fieldBg,
                        hintText: "Email",
                        hintStyle: GoogleFonts.inter(
                          color: hintColor,
                          fontSize: screenHeight * 0.02,
                        ),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Color(0xFF7A5CFF),
                        ),
                        enabledBorder:
                        _border(screenHeight * 0.04, fieldBorder),
                        focusedBorder:
                        _border(screenHeight * 0.04, fieldBorder),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.022,
                          horizontal: screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  /// 🔒 Password
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: TextField(
                      obscureText: _obscurePassword,
                      style: GoogleFonts.inter(
                        fontSize: screenHeight * 0.02,
                        color: textColor,
                      ),
                      decoration: InputDecoration(
                        filled: isDark,
                        fillColor: fieldBg,
                        hintText: "Password",
                        hintStyle: GoogleFonts.inter(
                          color: hintColor,
                          fontSize: screenHeight * 0.02,
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFF7A5CFF),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xFF7A5CFF),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        enabledBorder:
                        _border(screenHeight * 0.04, fieldBorder),
                        focusedBorder:
                        _border(screenHeight * 0.04, fieldBorder),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.025,
                          horizontal: screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  /// ❓ Forgot Password
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.inter(
                            color: const Color(0xFF7A5CFF),
                            fontSize: screenHeight * 0.016,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.015),

                  /// 🔘 Login Button
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: GestureDetector(
                      onTap: () async {
                        final role = await UserRoleStorage.getRole();

                        if (role == UserRole.manager) {
                          Navigator.pushReplacementNamed(
                              context, PageRouteName.homeManager);
                        } else if (role == UserRole.employee) {
                          Navigator.pushReplacementNamed(
                              context, PageRouteName.homeEmployee);
                        }
                      },
                      child: Container(
                        height: screenHeight * 0.07,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              screenHeight * 0.018),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF2FA4FF),
                              Color(0xFF7A5CFF),
                              Color(0xFFFF4FD8),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: screenHeight * 0.02,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.012),

                  /// 📝 Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: GoogleFonts.inter(
                          color:
                          isDark ? Colors.white70 : Colors.grey,
                          fontSize: screenHeight * 0.016,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, PageRouteName.register);
                        },
                        child: Text(
                          "Register",
                          style: GoogleFonts.inter(
                            color: const Color(0xFF7A5CFF),
                            fontSize: screenHeight * 0.016,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
