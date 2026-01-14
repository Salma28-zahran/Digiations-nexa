import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/route/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  OutlineInputBorder _border(double radius, bool isDark) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(
        color: isDark ? Colors.grey.shade700 : const Color(0xFFB9C0FF),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? image =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final textColor = isDark ? Colors.white : Colors.black87;
    final hintColor = isDark ? Colors.grey.shade400 : Colors.grey;
    final iconColor = const Color(0xFF7A5CFF);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: screenWidth * 0.75,
                child: Image.asset(
                  isDark
                      ? "assets/images/logo3.png"
                      : "assets/images/logo2.png",
                ),
              ),

              /// Profile Image
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDark
                          ? Colors.grey.shade700
                          : const Color(0xFFB9C0FF),
                      width: 3,
                    ),
                    gradient: LinearGradient(
                      colors: isDark
                          ? [
                        const Color(0xFF2A2A2A),
                        const Color(0xFF1E1E1E),
                      ]
                          : [
                        const Color(0xFFEAF2FF),
                        const Color(0xFFF1EDFF),
                      ],
                    ),
                  ),
                  child: CircleAvatar(
                    radius: screenWidth * 0.15,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                    _profileImage != null ? FileImage(_profileImage!) : null,
                    child: _profileImage == null
                        ? Icon(Icons.camera_alt,
                        size: screenWidth * 0.08, color: iconColor)
                        : null,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.01),

              Text(
                "Profile Image",
                style: GoogleFonts.inter(
                  color: iconColor,
                  fontSize: screenHeight * 0.02,
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              /// Full Name
              _inputField(
                context,
                hint: "Full Name",
                icon: Icons.person,
                isDark: isDark,
                obscure: false,
              ),

              SizedBox(height: screenHeight * 0.02),

              /// Email
              _inputField(
                context,
                hint: "Email",
                icon: Icons.email_outlined,
                isDark: isDark,
                obscure: false,
              ),

              SizedBox(height: screenHeight * 0.02),

              /// Password
              _inputField(
                context,
                hint: "Password",
                icon: Icons.lock_outline,
                isDark: isDark,
                obscure: true,
                suffix: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: iconColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              /// Register Button
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PageRouteName.login);
                  },
                  child: Container(
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
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
                        "Register",
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

              SizedBox(height: screenHeight * 0.015),

              /// Login Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already have an account? ",
                    style: GoogleFonts.inter(
                      color: hintColor,
                      fontSize: screenHeight * 0.016,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PageRouteName.login);
                    },
                    child: Text(
                      "login",
                      style: GoogleFonts.inter(
                        color: iconColor,
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
    );
  }

  Widget _inputField(
      BuildContext context, {
        required String hint,
        required IconData icon,
        required bool isDark,
        bool obscure = false,
        Widget? suffix,
      }) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: TextField(
        obscureText: obscure ? _obscurePassword : false,
        style: GoogleFonts.inter(
          color: isDark ? Colors.white : Colors.black87,
          fontSize: screenHeight * 0.02,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.inter(
            color: isDark ? Colors.grey.shade400 : Colors.grey,
          ),
          prefixIcon: Icon(icon, color: const Color(0xFF7A5CFF)),
          suffixIcon: suffix,
          filled: true,
          fillColor:
          isDark ? const Color(0xFF1E1E1E) : Colors.transparent,
          enabledBorder: _border(screenHeight * 0.04, isDark),
          focusedBorder: _border(screenHeight * 0.04, isDark),
        ),
      ),
    );
  }
}
